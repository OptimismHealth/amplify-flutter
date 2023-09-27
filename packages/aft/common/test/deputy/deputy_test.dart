// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'package:aft_common/aft_common.dart';
import 'package:aft_common/descriptors.dart' as d;
import 'package:aws_common/aws_common.dart';
import 'package:pub_semver/src/version.dart';
import 'package:test/test.dart';

void main() {
  group('Deputy', () {
    test('create', () async {
      await expectLater(Deputy.create(), completes);
    });

    test('scanAndUpdate', () async {
      final repo = await d.repo([
        d.package(
          'local_a',
          dependencies: {'third_party_a': '1.0.0'},
        ),
      ]).create();
      final deputy = Deputy(
        repo: repo,
        versionResolver: MockVersionResolver({
          'third_party_a': '1.1.0',
        }),
      );
      final updates = await deputy.scanForUpdates();
      expect(updates, isNotNull);
      expect(
        updates!.keys.single,
        DependencyUpdateGroup.of(['third_party_a']),
        reason: 'Only "third_party_a" should be updated',
      );
      await updates.updatePubspecs();
      await d.repo([
        d.package(
          'local_a',
          dependencies: {'third_party_a': '1.1.0'},
        ),
      ]).validate();
    });

    test('groups', () async {
      final repo = await d.repo([
        d.package(
          'local_a',
          dependencies: {
            'third_party_a': '1.0.0',
            'third_party_b': '1.0.0',
            'third_party_c': '1.0.0',
          },
        ),
      ]).create();
      final abGroup =
          DependencyUpdateGroup.of(['third_party_a', 'third_party_b']);
      final cGroup = DependencyUpdateGroup.of(['third_party_c']);
      final deputy = Deputy(
        dependencyGroups: [abGroup],
        repo: repo,
        versionResolver: MockVersionResolver({
          'third_party_a': '1.1.0',
          'third_party_b': '1.1.0',
          'third_party_c': '1.1.0',
        }),
      );
      final updates = await deputy.scanForUpdates();
      expect(updates, isNotNull);

      expect(
        updates!.keys,
        unorderedEquals([abGroup, cGroup]),
        reason: 'The third party group should be bundled together. '
            'third_party_c should be in its own group.',
      );
      await updates.updatePubspecs();
      await d.repo([
        d.package(
          'local_a',
          dependencies: {
            'third_party_a': '1.1.0',
            'third_party_b': '1.1.0',
            'third_party_c': '1.1.0',
          },
        ),
      ]).validate();
    });
  });
}

final class MockVersionResolver extends VersionResolver {
  MockVersionResolver(Map<String, String> versions)
      : versions = versions.map(
          (name, spec) => MapEntry(name, Version.parse(spec)),
        ),
        super(logger: AWSLogger().createChild('MockVersionResolver'));

  final Map<String, Version> versions;

  @override
  Version? latestVersion(String package) {
    return versions[package];
  }
}
