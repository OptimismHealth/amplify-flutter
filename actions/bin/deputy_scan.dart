// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:actions/actions.dart';
import 'package:actions/src/logger.dart';
import 'package:actions/src/node/platform.dart';
import 'package:actions/src/node/process_manager.dart';
import 'package:aft_common/aft_common.dart';
import 'package:aws_common/aws_common.dart';
import 'package:node_io/node_io.dart';
import 'package:pub_semver/pub_semver.dart';

/// Scans for outdated Dart and Flutter dependencies and creates PRs for version updates.
Future<void> main() => wrapMain(_deputyScan);

Future<void> _deputyScan() async {
  final logger = AWSLogger().createChild('Deputy')
    ..unregisterAllPlugins()
    ..registerPlugin(const NodeLoggerPlugin());
  final deputy = await Deputy.create(
    fileSystem: nodeFileSystem,
    platform: const NodePlatform(),
    processManager: processManager,
    logger: logger,
  );
  final updates = await core.withGroup(
    'Scan for Updates',
    deputy.scanForUpdates,
  );
  if (updates == null) {
    return core.info('No updates needed');
  }
  final git = NodeGitDir(deputy.repo.git);
  final existingPrs = await _listExistingPrs();
  final tmpDir = nodeFileSystem.systemTempDirectory.createTempSync('deputy');
  final currentHead = await git.revParse('HEAD');
  core.info('Current HEAD: $currentHead');

  // Create a PR for each dependency group which does not already have a PR.
  for (final MapEntry(key: dependencyName, value: groupUpdate)
      in updates.entries) {
    await core.withGroup('Create PR for "$dependencyName"', () async {
      core.info('Resetting to current HEAD...');
      await git.runCommand(['checkout', currentHead]);
      final updatedConstraint = groupUpdate.updatedConstraint;
      int? closeExisting;
      if (existingPrs[dependencyName] case (final prNumber, final constraint)) {
        if (constraint == updatedConstraint) {
          core.info(
            'Skipping "$dependencyName". PR already exists for same update ($constraint): '
            'https://github.com/aws-amplify/amplify-flutter/pull/$prNumber',
          );
          return;
        }

        // Close existing PR after new PR is created
        closeExisting = prNumber;
      }

      // Update pubspecs for the dependency and commit changes to a new branch.
      core.info('Creating new worktree...');
      const baseBranch = 'origin/main';
      final constraint = updatedConstraint
          .toString()
          .replaceAll(_specialChars, '')
          .replaceAll(' ', '-');
      final branchName = 'chore/deps/$dependencyName-$constraint';
      final worktreeDir = nodeFileSystem.systemTempDirectory
          .createTempSync('worktree_$dependencyName')
          .path;
      await git.runCommand([
        'worktree',
        'add',
        worktreeDir,
        '-b',
        branchName,
        baseBranch,
      ]);
      final worktree = NodeGitDir(
        await GitDir.fromExisting(
          worktreeDir,
          processManager: processManager,
        ),
      );

      core.info('Updating pubspecs...');
      await groupUpdate.updatePubspecs(worktreeDir);

      core.info('Diffing changes...');
      await worktree.runCommand(['diff']);

      core.info('Committing changes...');
      final commitTitle =
          '"chore(deps): Bump $dependencyName to $updatedConstraint"';
      await worktree.runCommand(['add', '-A']);
      await worktree.runCommand(['commit', '-m', commitTitle]);
      await worktree.runCommand(['push', '-f', '-u', 'origin', branchName]);

      // Create a PR for the changes using the `gh` CLI.
      core.info('Creating PR...');
      final prBody = '''
> **NOTE:** This PR was automatically created using the repo deputy.

Updated $dependencyName to `$updatedConstraint`

Updated-Dependency: $dependencyName
Updated-Constraint: $updatedConstraint
''';
      final tmpFile = tmpDir.childFile('pr_body_$dependencyName.txt')
        ..createSync()
        ..writeAsStringSync(prBody);
      final prResult = processManager.runSync(
        <String>[
          'gh',
          'pr',
          'create',
          '--base=main',
          '--body-file=${tmpFile.path}',
          '--title=$commitTitle',
          '--draft',
        ],
        workingDirectory: worktreeDir,
      );
      if (prResult.exitCode != 0) {
        core.error(
          'Failed to create PR (${prResult.exitCode}): ${prResult.stderr}',
        );
        process.exitCode = 1;
        return;
      }

      // Close existing PR with comment pointing to new PR.
      if (closeExisting == null) {
        return;
      }

      core.info('Closing existing PR...');
      final closeResult = processManager.runSync(<String>[
        'gh',
        'pr',
        'close',
        '$closeExisting',
        '--comment="Dependency has been updated. Closing in favor of new PR."',
      ]);
      if (closeResult.exitCode != 0) {
        core.error(
          'Failed to close existing PR. Will need to be closed manually: '
          'https://github.com/aws-amplify/amplify-flutter/pull/$closeExisting',
        );
        process.exitCode = 1;
        return;
      }
    });
  }
}

/// Lists all Deputy PRs which currently exist in the repo with the PR number
/// and the constraint
Future<Map<String, _ExistingPr>> _listExistingPrs() async {
  final octokit = github.getOctokit(process.getEnv('GITHUB_TOKEN')!);
  return core.withGroup('Check for existing PRs', () async {
    final existingPrs = <String, _ExistingPr>{};
    final pulls = await octokit.rest.pulls.list();
    for (final pull in pulls) {
      final commitMessage =
          CommitMessage.parse('', pull.title, body: pull.body);
      final trailers = commitMessage.trailers;
      // TODO(dnys1): Remove
      core.info('Trailers for #${pull.number}: $trailers');
      final dependencyName = trailers['Updated-Dependency'];
      final constraintStr = trailers['Updated-Constraint'];
      if (dependencyName == null || constraintStr == null) {
        continue;
      }
      final constraint = VersionConstraint.parse(constraintStr);
      existingPrs[dependencyName] = (pull.number, constraint);
    }
    core.info('Found existing PRs: $existingPrs');
    return existingPrs;
  });
}

typedef _ExistingPr = (int prNumber, VersionConstraint constraint);

/// Special characters which appear in stringified [VersionConstraint]s.
final _specialChars = RegExp(r'[\^<>=]');

extension type NodeGitDir(GitDir it) implements GitDir {
  Future<void> runCommand(List<String> args) => it.runCommand(
    args, 
    stdout: stdout.writeln, 
    stderr: stderr.writeln,
  );
}