import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

part 'task.freezed.dart';
part 'task.g.dart';

@freezed
abstract class Task with _$Task {
  const factory Task({
    required String id,
    required String orgId,
    required String title,
    required String description,
    required String creatorId,
    required List<String> watcherIds,
    required Priority priority,
    required TaskStatus status,
    required List<String> tags,
    required List<String> subtaskIds,
    required List<String> blockedByTaskIds,
    required List<String> attachmentIds,
    required int escalationLevel,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int version,
    String? assigneeId,
    String? teamId,
    DateTime? dueAt,
    DateTime? startAt,
    int? estimatedMinutes,
    String? parentTaskId,
    String? escalationPolicyId,
    DateTime? slaDeadlineAt,
    DateTime? snoozedUntil,
    DateTime? completedAt,
    DateTime? assignedAt,
    DateTime? blockedAt,
    DateTime? lastActivityAt,
    @Default(0) int reassignmentCount,
    @Default(false) bool needsAttention,
    @Default(false) bool isDeleted,
    @Default(SyncState.synced) SyncState syncState,
  }) = _Task;

  factory Task.fromJson(Map<String, Object?> json) => _$TaskFromJson(json);

  static Result<Task> validated({
    required String id,
    required String orgId,
    required String title,
    required String description,
    required String creatorId,
    required Priority priority,
    required TaskStatus status,
    required DateTime createdAt,
    String? assigneeId,
    String? teamId,
    DateTime? dueAt,
  }) {
    final cleanTitle = title.trim();
    if (cleanTitle.isEmpty || cleanTitle.length > 140) {
      return const Error<Task>(
        ValidationFailure('Title must contain 1–140 characters.'),
      );
    }
    if (description.length > 10000) {
      return const Error<Task>(
        ValidationFailure('Description cannot exceed 10,000 characters.'),
      );
    }
    if (id.isEmpty || orgId.isEmpty || creatorId.isEmpty) {
      return const Error<Task>(
        ValidationFailure('Task, organization, and creator IDs are required.'),
      );
    }
    final now = createdAt.toUtc();
    return Success<Task>(
      Task(
        id: id,
        orgId: orgId,
        title: cleanTitle,
        description: description,
        creatorId: creatorId,
        assigneeId: assigneeId,
        watcherIds: const <String>[],
        teamId: teamId,
        priority: priority,
        status: status,
        dueAt: dueAt?.toUtc(),
        tags: const <String>[],
        subtaskIds: const <String>[],
        blockedByTaskIds: const <String>[],
        attachmentIds: const <String>[],
        escalationLevel: 0,
        createdAt: now,
        updatedAt: now,
        lastActivityAt: now,
        version: 1,
      ),
    );
  }
}

@freezed
abstract class TaskActivity with _$TaskActivity {
  const factory TaskActivity({
    required String id,
    required String taskId,
    required String actorId,
    required ActivityType type,
    required Map<String, Object?> before,
    required Map<String, Object?> after,
    required DateTime createdAt,
  }) = _TaskActivity;

  factory TaskActivity.fromJson(Map<String, Object?> json) =>
      _$TaskActivityFromJson(json);
}

@freezed
abstract class TaskMutation with _$TaskMutation {
  const factory TaskMutation({
    required Task task,
    required TaskActivity activity,
  }) = _TaskMutation;
}
