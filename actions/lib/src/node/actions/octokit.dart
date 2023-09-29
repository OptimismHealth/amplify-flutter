// Copyright Amazon.com, Inc. or its affiliates. All Rights Reserved.
// SPDX-License-Identifier: Apache-2.0

import 'dart:js_interop';

import 'package:actions/src/node/actions/github.dart';
import 'package:aws_common/aws_common.dart';

@JS()
@anonymous
extension type Octokit._(JSObject it) {
  external OctokitRest get rest;
}

@JS()
@anonymous
extension type OctokitRest._(JSObject it) {
  external OctokitRestActions get actions;
  external OctokitRestIssues get issues;
  external OctokitRestPulls get pulls;
}

@JS()
@anonymous
extension type OctokitRestActions._(JSObject it) {
  /// https://github.com/octokit/plugin-rest-endpoint-methods.js/blob/main/docs/actions/listJobsForWorkflowRun.md
  @JS('listJobsForWorkflowRun')
  external JSPromise _listJobsForWorkflowRun(ListJobsForWorkflowRunParams params);

  /// Lists jobs for a workflow run.
  /// 
  /// https://docs.github.com/en/rest/actions/workflow-jobs?apiVersion=2022-11-28#get-a-job-for-a-workflow-run
  Future<ListJobsForWorkflowRunResponse> listJobsForWorkflowRun() async {
    final promise = _listJobsForWorkflowRun(
      ListJobsForWorkflowRunParams(
        owner: github.context.repo.owner,
        repo: github.context.repo.repo,
        runId: github.context.runId,
      ),
    );
    final response = await promise.toDart;
    return response as ListJobsForWorkflowRunResponse;
  }
}

enum IssueState { open, closed, all }

@JS()
@anonymous
extension type OctokitRestPulls._(JSObject it) {
  /// https://github.com/octokit/plugin-rest-endpoint-methods.js/blob/main/docs/pulls/list.md
  @JS('list')
  external JSPromise _list(ListPullsRequest params);

  /// Lists pull requests in the repo.
  /// 
  /// https://docs.github.com/en/rest/pulls/pulls?apiVersion=2022-11-28#list-pull-requests
  Future<List<PullRequest>> list({IssueState state = IssueState.open}) async {
    final promise = _list(
      ListPullsRequest(
        owner: github.context.repo.owner,
        repo: github.context.repo.repo,
        state: state.name,
      ),
    );
    final response = await promise.toDart;
    return (response as ListPullsResponse).pulls;
  }
}

@JS()
@anonymous
extension type OctokitRestIssues._(JSObject it) {
  /// https://github.com/octokit/plugin-rest-endpoint-methods.js/blob/main/docs/issues/list.md
  @JS('list')
  external JSPromise _list(ListIssuesRequest params);

  /// Lists issues in the repo.
  /// 
  /// https://docs.github.com/en/rest/issues/issues?apiVersion=2022-11-28#list-repository-issues
  Future<List<Issue>> list({IssueState state = IssueState.open}) async {
    final promise = _list(
      ListIssuesRequest(
        owner: github.context.repo.owner,
        repo: github.context.repo.repo,
        state: state.name,
      ),
    );
    final response = await promise.toDart;
    return (response as ListIssuesResponse).issues;
  }
}

@JS()
@anonymous
extension type ListJobsForWorkflowRunParams._(JSObject it) {
  external factory ListJobsForWorkflowRunParams({
    required String owner,
    required String repo,
    required int runId,
  });
}

@JS()
@anonymous
extension type ListJobsForWorkflowRunResponse._(JSObject it) {
  @JS('data.jobs')
  external JSArray get _jobs;

  List<Job> get jobs => _jobs.toDart.cast<Job>();
}

@JS()
@anonymous
extension type ListIssuesRequest._(JSObject it) {
  external factory ListIssuesRequest({
    required String owner,
    required String repo,
    String? state,
  });
}

@JS()
@anonymous
extension type ListIssuesResponse._(JSObject it) {
  @JS()
  external JSArray get data;
  
  List<Issue> get issues => data.toDart.cast();
}

@JS()
@anonymous
extension type ListPullsRequest._(JSObject it) {
  external factory ListPullsRequest({
    required String owner,
    required String repo,
    String? state,
  });
}

@JS()
@anonymous
extension type ListPullsResponse._(JSObject it) {
  @JS()
  external JSArray get data;
  
  List<PullRequest> get pulls => data.toDart.cast();
}

@JS()
@anonymous
extension type Issue._(JSObject it) {
  external int get number;
  external String get title;
  external String get body;
}

@JS()
@anonymous
extension type PullRequest._(JSObject it) implements Issue {}

/// Information of a job execution in a workflow run.
@JS()
@anonymous
extension type Job._(JSObject it) {
  /// The id of the job.
  external int get id;
  
  /// The id of the associated workflow run.
  @JS('run_id')
  external int get runId;
  
  @JS('run_url')
  external String get runUrl;

  /// Attempt number of the associated workflow run.
  /// 
  /// 1 for first attempt and higher if the workflow was re-run.
  @JS('run_attempt')
  external int get runAttempt;
  
  @JS('node_id')
  external String get nodeId;

  /// The SHA of the commit that is being run.
  @JS('head_sha')
  external String get headSha;

  external String get url;

  @JS('html_url')
  external String get htmlUrl;

  @JS('status')
  external String get _status;
  Status get status => Status.values.firstWhere((v) => v.name.snakeCase == _status);

  @JS('conclusion')
  external String? get _conclusion;
  Conclusion? get conclusion => _conclusion == null ? null : Conclusion.values.firstWhere((v) => v.name.snakeCase == _conclusion);

  @JS('created_at')
  external String _createdAt;
  DateTime get createdAt => DateTime.parse(_createdAt);

  @JS('started_at')
  external String _startedAt;
  DateTime get startedAt => DateTime.parse(_startedAt);

  @JS('completed_at')
  external String? _completedAt;
  DateTime? get completedAt => _completedAt == null ? null : DateTime.parse(_completedAt!);

  @JS('steps')
  external JSArray get _steps;
  List<Step> get steps => _steps.toDart.cast<Step>();
}

enum Status { queued, inProgress, completed }
enum Conclusion { success, failure, neutral, cancelled, skipped, timedOut, actionRequired }

@JS()
@anonymous
extension type Step._(JSObject it) {
  external String get name;
  external int get number;

  @JS('status')
  external String get _status;
  Status get status => Status.values.firstWhere((v) => v.name.snakeCase == _status);

  @JS('conclusion')
  external String? get _conclusion;
  Conclusion? get conclusion => _conclusion == null ? null : Conclusion.values.firstWhere((v) => v.name.snakeCase == _conclusion);

  @JS('started_at')
  external String _startedAt;
  DateTime get startedAt => DateTime.parse(_startedAt);

  @JS('completed_at')
  external String? _completedAt;
  DateTime? get completedAt => _completedAt == null ? null : DateTime.parse(_completedAt!);
}
