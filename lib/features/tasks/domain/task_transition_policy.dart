import 'package:relay/core/clock.dart';
import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class TaskTransitionPolicy {
  const TaskTransitionPolicy();

  static const Map<TaskStatus, Set<TaskStatus>> _allowed = {
    TaskStatus.draft: {TaskStatus.open, TaskStatus.cancelled},
    TaskStatus.open: {TaskStatus.assigned, TaskStatus.cancelled},
    TaskStatus.assigned: {
      TaskStatus.accepted,
      TaskStatus.declined,
      TaskStatus.cancelled,
      TaskStatus.open,
    },
    TaskStatus.accepted: {
      TaskStatus.inProgress,
      TaskStatus.blocked,
      TaskStatus.cancelled,
    },
    TaskStatus.inProgress: {
      TaskStatus.blocked,
      TaskStatus.inReview,
      TaskStatus.done,
      TaskStatus.cancelled,
    },
    TaskStatus.blocked: {TaskStatus.inProgress, TaskStatus.cancelled},
    TaskStatus.inReview: {TaskStatus.done, TaskStatus.inProgress},
    TaskStatus.declined: {TaskStatus.assigned, TaskStatus.open},
    TaskStatus.done: <TaskStatus>{},
    TaskStatus.cancelled: <TaskStatus>{},
  };

  bool canTransition({
    required TaskStatus from,
    required TaskStatus to,
    required MemberRole actorRole,
    required bool isAssignee,
    required bool isCreator,
    bool hasUnresolvedBlockers = false,
    bool force = false,
  }) {
    if (!(_allowed[from]?.contains(to) ?? false)) return false;
    final manager =
        actorRole == MemberRole.owner ||
        actorRole == MemberRole.admin ||
        actorRole == MemberRole.manager;
    if (actorRole == MemberRole.viewer) return false;
    if (from == TaskStatus.declined && !(isCreator || manager)) return false;
    if (from == TaskStatus.blocked &&
        to == TaskStatus.inProgress &&
        hasUnresolvedBlockers &&
        !(force && manager)) {
      return false;
    }
    if ((to == TaskStatus.accepted || to == TaskStatus.declined) &&
        !isAssignee) {
      return false;
    }
    return true;
  }

  Result<TaskMutation> applyTransition({
    required Task task,
    required TaskStatus to,
    required String actorId,
    required MemberRole actorRole,
    required Clock clock,
    bool force = false,
  }) {
    if (!canTransition(
      from: task.status,
      to: to,
      actorRole: actorRole,
      isAssignee: task.assigneeId == actorId,
      isCreator: task.creatorId == actorId,
      hasUnresolvedBlockers: task.blockedByTaskIds.isNotEmpty,
      force: force,
    )) {
      return Error<TaskMutation>(
        InvalidTransitionFailure(
          'Cannot move ${task.status.name} to ${to.name} for this actor.',
        ),
      );
    }
    final now = clock.now();
    final next = task.copyWith(
      status: to,
      updatedAt: now,
      lastActivityAt: now,
      completedAt: to == TaskStatus.done ? now : task.completedAt,
      blockedAt: to == TaskStatus.blocked ? now : null,
      version: task.version + 1,
    );
    return Success<TaskMutation>(
      TaskMutation(
        task: next,
        activity: TaskActivity(
          id: '${task.id}:${task.version + 1}:status',
          taskId: task.id,
          actorId: actorId,
          type: ActivityType.statusChanged,
          before: <String, Object?>{'status': task.status.name},
          after: <String, Object?>{'status': to.name, 'forced': force},
          createdAt: now,
        ),
      ),
    );
  }
}
