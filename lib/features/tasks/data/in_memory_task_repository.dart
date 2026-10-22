import 'dart:async';

import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/repositories.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class InMemoryTaskRepository implements TaskRepository {
  InMemoryTaskRepository([Iterable<Task> seed = const <Task>[]]) {
    for (final task in seed) {
      _tasks[task.id] = task;
    }
  }

  final Map<String, Task> _tasks = <String, Task>{};
  final StreamController<void> _changes = StreamController<void>.broadcast();
  final List<TaskActivity> activities = <TaskActivity>[];

  @override
  Future<Result<Task>> getTask(String orgId, String taskId) async {
    final task = _tasks[taskId];
    if (task == null || task.orgId != orgId || task.isDeleted) {
      return const Error<Task>(NotFoundFailure('Task not found.'));
    }
    return Success<Task>(task);
  }

  @override
  Stream<Result<Task>> watchTask(String orgId, String taskId) async* {
    yield await getTask(orgId, taskId);
    await for (final _ in _changes.stream) {
      yield await getTask(orgId, taskId);
    }
  }

  @override
  Stream<Result<List<Task>>> watchMyTasks(String orgId, String userId) =>
      _watchWhere((task) => task.orgId == orgId && task.assigneeId == userId);

  @override
  Stream<Result<List<Task>>> watchDelegatedByMe(String orgId, String userId) =>
      _watchWhere((task) => task.orgId == orgId && task.creatorId == userId);

  @override
  Stream<Result<List<Task>>> watchTeamTasks(String orgId, String teamId) =>
      _watchWhere((task) => task.orgId == orgId && task.teamId == teamId);

  Stream<Result<List<Task>>> _watchWhere(
    bool Function(Task task) predicate,
  ) async* {
    yield Success<List<Task>>(_sorted(predicate));
    await for (final _ in _changes.stream) {
      yield Success<List<Task>>(_sorted(predicate));
    }
  }

  List<Task> _sorted(bool Function(Task task) predicate) {
    final result = _tasks.values
        .where((task) => !task.isDeleted && predicate(task))
        .toList();
    result.sort((a, b) {
      final status = _statusGroup(a.status).compareTo(_statusGroup(b.status));
      if (status != 0) return status;
      final due = _compareNullableDate(a.dueAt, b.dueAt);
      if (due != 0) return due;
      final created = a.createdAt.compareTo(b.createdAt);
      return created != 0 ? created : a.id.compareTo(b.id);
    });
    return result;
  }

  @override
  Future<Result<Page<Task>>> searchTasks({
    required String orgId,
    required String query,
    required int limit,
    String? cursor,
  }) async {
    final normalized = query.toLowerCase();
    final all = _sorted(
      (task) =>
          task.orgId == orgId &&
          (task.title.toLowerCase().contains(normalized) ||
              task.description.toLowerCase().contains(normalized)),
    );
    final offset = int.tryParse(cursor ?? '') ?? 0;
    final items = all.skip(offset).take(limit).toList(growable: false);
    final next = offset + items.length < all.length
        ? (offset + items.length).toString()
        : null;
    return Success<Page<Task>>(Page<Task>(items: items, nextCursor: next));
  }

  @override
  Future<Result<Task>> save(TaskMutation mutation) async {
    final current = _tasks[mutation.task.id];
    if (current != null && mutation.task.version != current.version + 1) {
      return Error<Task>(
        ConflictFailure(
          'Task changed on another device.',
          remoteVersion: current.version,
        ),
      );
    }
    final saved = mutation.task.copyWith(syncState: SyncState.synced);
    _tasks[saved.id] = saved;
    activities.add(mutation.activity);
    _changes.add(null);
    return Success<Task>(saved);
  }

  @override
  Future<Result<Task>> softDelete({
    required Task task,
    required TaskActivity activity,
  }) => save(TaskMutation(task: task, activity: activity));

  @override
  Future<List<ItemResult<Task>>> saveAll(List<TaskMutation> mutations) async {
    final results = <ItemResult<Task>>[];
    for (final mutation in mutations) {
      results.add(
        ItemResult<Task>(id: mutation.task.id, result: await save(mutation)),
      );
    }
    return results;
  }

  @override
  Future<Result<Unit>> addComment({
    required String orgId,
    required String taskId,
    required String actorId,
    required String markdown,
    required DateTime createdAt,
  }) async {
    if (!_tasks.containsKey(taskId)) {
      return const Error<Unit>(NotFoundFailure('Task not found.'));
    }
    activities.add(
      TaskActivity(
        id: '$taskId:${createdAt.microsecondsSinceEpoch}:comment',
        taskId: taskId,
        actorId: actorId,
        type: ActivityType.commented,
        before: const <String, Object?>{},
        after: <String, Object?>{'markdown': markdown},
        createdAt: createdAt,
      ),
    );
    _changes.add(null);
    return const Success<Unit>(unit);
  }

  int _statusGroup(TaskStatus status) => switch (status) {
    TaskStatus.assigned => 0,
    TaskStatus.blocked => 1,
    TaskStatus.inProgress || TaskStatus.inReview => 2,
    TaskStatus.accepted || TaskStatus.open => 3,
    TaskStatus.draft || TaskStatus.declined => 4,
    TaskStatus.done || TaskStatus.cancelled => 5,
  };

  int _compareNullableDate(DateTime? a, DateTime? b) {
    if (a == null && b == null) return 0;
    if (a == null) return 1;
    if (b == null) return -1;
    return a.compareTo(b);
  }

  Future<void> dispose() => _changes.close();
}
