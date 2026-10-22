import 'package:relay/core/clock.dart';
import 'package:relay/core/failure.dart';
import 'package:relay/core/result.dart';
import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:relay/features/organization/domain/permission_policy.dart';
import 'package:relay/features/tasks/domain/dependency_graph.dart';
import 'package:relay/features/tasks/domain/repositories.dart';
import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_transition_policy.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class CreateTask {
  const CreateTask(this.repository, this.clock);

  final TaskRepository repository;
  final Clock clock;

  Future<Result<Task>> call({
    required String id,
    required String orgId,
    required String title,
    required String description,
    required String creatorId,
    required Priority priority,
    String? teamId,
    DateTime? dueAt,
  }) async {
    final result = Task.validated(
      id: id,
      orgId: orgId,
      title: title,
      description: description,
      creatorId: creatorId,
      priority: priority,
      status: TaskStatus.draft,
      createdAt: clock.now(),
      teamId: teamId,
      dueAt: dueAt,
    );
    if (result case Error<Task>()) return result;
    final task = (result as Success<Task>).value;
    return repository.save(
      TaskMutation(
        task: task,
        activity: TaskActivity(
          id: '${task.id}:1:create',
          taskId: task.id,
          actorId: creatorId,
          type: ActivityType.created,
          before: const <String, Object?>{},
          after: <String, Object?>{'title': task.title},
          createdAt: clock.now(),
        ),
      ),
    );
  }
}

final class UpdateTask {
  const UpdateTask(this.repository, this.clock);

  final TaskRepository repository;
  final Clock clock;

  Future<Result<Task>> call({
    required Task task,
    required String actorId,
    String? title,
    String? description,
    DateTime? dueAt,
  }) async {
    final checked = Task.validated(
      id: task.id,
      orgId: task.orgId,
      title: title ?? task.title,
      description: description ?? task.description,
      creatorId: task.creatorId,
      priority: task.priority,
      status: task.status,
      createdAt: task.createdAt,
      assigneeId: task.assigneeId,
      teamId: task.teamId,
      dueAt: dueAt ?? task.dueAt,
    );
    if (checked case Error<Task>(:final failure)) return Error<Task>(failure);
    final now = clock.now();
    final next = task.copyWith(
      title: title?.trim() ?? task.title,
      description: description ?? task.description,
      dueAt: dueAt ?? task.dueAt,
      updatedAt: now,
      lastActivityAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: _activity(
          task: task,
          actorId: actorId,
          type: ActivityType.updated,
          now: now,
        ),
      ),
    );
  }
}

final class DeleteTask {
  const DeleteTask(this.repository, this.clock);

  final TaskRepository repository;
  final Clock clock;

  Future<Result<Task>> call(Task task, String actorId) {
    final now = clock.now();
    final next = task.copyWith(
      isDeleted: true,
      version: task.version + 1,
      updatedAt: now,
      syncState: SyncState.pending,
    );
    return repository.softDelete(
      task: next,
      activity: _activity(
        task: task,
        actorId: actorId,
        type: ActivityType.deleted,
        now: now,
      ),
    );
  }
}

final class AssignTask {
  const AssignTask(this.repository, this.clock);

  final TaskRepository repository;
  final Clock clock;

  Future<Result<Task>> call({
    required Task task,
    required String actorId,
    required Membership assignee,
    required List<Membership> memberships,
    String? routedFromUserId,
  }) async {
    if (assignee.orgId != task.orgId ||
        assignee.status != MembershipStatus.active ||
        (task.teamId != null && !assignee.teamIds.contains(task.teamId))) {
      return const Error<Task>(
        ValidationFailure(
          'Assignee must be an active member of the task team.',
        ),
      );
    }
    final now = clock.now();
    final next = task.copyWith(
      assigneeId: assignee.userId,
      status: TaskStatus.assigned,
      assignedAt: now,
      updatedAt: now,
      lastActivityAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: TaskActivity(
          id: '${task.id}:${next.version}:assign',
          taskId: task.id,
          actorId: actorId,
          type: ActivityType.assigned,
          before: <String, Object?>{'assigneeId': task.assigneeId},
          after: <String, Object?>{
            'assigneeId': assignee.userId,
            if (routedFromUserId != null) 'routedFromUserId': routedFromUserId,
          },
          createdAt: now,
        ),
      ),
    );
  }
}

final class ReassignTask {
  const ReassignTask(this.assign, this.permissionPolicy);

  final AssignTask assign;
  final PermissionPolicy permissionPolicy;

  Future<Result<Task>> call({
    required Task task,
    required String actorId,
    required MemberRole actorRole,
    required Membership assignee,
    required List<Membership> memberships,
  }) {
    final needsManager = task.reassignmentCount >= 3;
    if (needsManager &&
        !permissionPolicy.allows(
          permission: Permission.forceTransition,
          role: actorRole,
          actorId: actorId,
          task: task,
          managesTeam: true,
        )) {
      return Future<Result<Task>>.value(
        const Error<Task>(
          PermissionDeniedFailure(
            'A manager must approve further reassignment.',
          ),
        ),
      );
    }
    return assign(
      task: task.copyWith(reassignmentCount: task.reassignmentCount + 1),
      actorId: actorId,
      assignee: assignee,
      memberships: memberships,
    );
  }
}

final class ChangeStatus {
  const ChangeStatus(this.repository, this.policy, this.clock);

  final TaskRepository repository;
  final TaskTransitionPolicy policy;
  final Clock clock;

  Future<Result<Task>> call({
    required Task task,
    required TaskStatus status,
    required String actorId,
    required MemberRole actorRole,
    bool force = false,
  }) async {
    final result = policy.applyTransition(
      task: task,
      to: status,
      actorId: actorId,
      actorRole: actorRole,
      clock: clock,
      force: force,
    );
    return switch (result) {
      Success<TaskMutation>(:final value) => repository.save(value),
      Error<TaskMutation>(:final failure) => Error<Task>(failure),
    };
  }
}

final class AcceptTask {
  const AcceptTask(this.changeStatus);
  final ChangeStatus changeStatus;
  Future<Result<Task>> call(Task task, String actorId, MemberRole role) =>
      changeStatus(
        task: task,
        status: TaskStatus.accepted,
        actorId: actorId,
        actorRole: role,
      );
}

final class DeclineTask {
  const DeclineTask(this.changeStatus);
  final ChangeStatus changeStatus;
  Future<Result<Task>> call({
    required Task task,
    required String actorId,
    required MemberRole role,
    required String reason,
  }) {
    if (reason.trim().isEmpty) {
      return Future<Result<Task>>.value(
        const Error<Task>(ValidationFailure('A decline reason is required.')),
      );
    }
    return changeStatus(
      task: task,
      status: TaskStatus.declined,
      actorId: actorId,
      actorRole: role,
    );
  }
}

final class ChangePriority {
  const ChangePriority(this.repository, this.permissions, this.clock);
  final TaskRepository repository;
  final PermissionPolicy permissions;
  final Clock clock;

  Future<Result<Task>> call({
    required Task task,
    required Priority priority,
    required String actorId,
    required MemberRole role,
    bool managesTeam = false,
  }) {
    if (priority.weight < task.priority.weight &&
        !permissions.allows(
          permission: Permission.lowerPriority,
          role: role,
          actorId: actorId,
          task: task,
          managesTeam: managesTeam,
        )) {
      return Future<Result<Task>>.value(
        const Error<Task>(
          PermissionDeniedFailure(
            'Only the creator or a manager may lower priority.',
          ),
        ),
      );
    }
    final now = clock.now();
    final next = task.copyWith(
      priority: priority,
      updatedAt: now,
      lastActivityAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: _activity(
          task: task,
          actorId: actorId,
          type: ActivityType.priorityChanged,
          now: now,
        ),
      ),
    );
  }
}

final class SnoozeTask {
  const SnoozeTask(this.repository, this.clock);
  final TaskRepository repository;
  final Clock clock;
  Future<Result<Task>> call(Task task, DateTime until, String actorId) {
    if (!until.isAfter(clock.now())) {
      return Future<Result<Task>>.value(
        const Error<Task>(
          ValidationFailure('Snooze time must be in the future.'),
        ),
      );
    }
    final now = clock.now();
    final next = task.copyWith(
      snoozedUntil: until.toUtc(),
      updatedAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: _activity(
          task: task,
          actorId: actorId,
          type: ActivityType.updated,
          now: now,
        ),
      ),
    );
  }
}

final class AddDependency {
  const AddDependency(this.repository, this.graph, this.clock);
  final TaskRepository repository;
  final DependencyGraph graph;
  final Clock clock;
  Future<Result<Task>> call({
    required Task task,
    required String dependencyId,
    required String actorId,
    required Map<String, Set<String>> edges,
  }) async {
    final validation = graph.validateEdge(
      taskId: task.id,
      dependencyId: dependencyId,
      edges: edges,
    );
    if (validation case Error<Unit>(:final failure)) {
      return Error<Task>(failure);
    }
    final now = clock.now();
    final next = task.copyWith(
      blockedByTaskIds: {...task.blockedByTaskIds, dependencyId}.toList(),
      updatedAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: _activity(
          task: task,
          actorId: actorId,
          type: ActivityType.updated,
          now: now,
        ),
      ),
    );
  }
}

final class RemoveDependency {
  const RemoveDependency(this.repository, this.clock);
  final TaskRepository repository;
  final Clock clock;
  Future<Result<Task>> call(Task task, String dependencyId, String actorId) {
    final now = clock.now();
    final next = task.copyWith(
      blockedByTaskIds: task.blockedByTaskIds
          .where((id) => id != dependencyId)
          .toList(),
      updatedAt: now,
      version: task.version + 1,
      syncState: SyncState.pending,
    );
    return repository.save(
      TaskMutation(
        task: next,
        activity: _activity(
          task: task,
          actorId: actorId,
          type: ActivityType.updated,
          now: now,
        ),
      ),
    );
  }
}

final class AddComment {
  const AddComment(this.repository, this.clock);
  final TaskRepository repository;
  final Clock clock;
  Future<Result<Unit>> call({
    required String orgId,
    required String taskId,
    required String actorId,
    required String markdown,
  }) {
    final clean = markdown.trim().replaceAll(RegExp('<[^>]*>'), '');
    if (clean.isEmpty || clean.length > 10000) {
      return Future<Result<Unit>>.value(
        const Error<Unit>(
          ValidationFailure('Comment must contain 1–10,000 characters.'),
        ),
      );
    }
    return repository.addComment(
      orgId: orgId,
      taskId: taskId,
      actorId: actorId,
      markdown: clean,
      createdAt: clock.now(),
    );
  }
}

final class ManualEscalate {
  const ManualEscalate(this.repository);
  final EscalationRepository repository;
  Future<Result<Unit>> call({
    required Task task,
    required String actorId,
    required String reason,
  }) {
    if (reason.trim().isEmpty) {
      return Future<Result<Unit>>.value(
        const Error<Unit>(
          ValidationFailure('An escalation reason is required.'),
        ),
      );
    }
    return repository.requestManualEscalation(
      orgId: task.orgId,
      taskId: task.id,
      actorId: actorId,
      reason: reason.trim(),
      expectedVersion: task.version,
    );
  }
}

final class ResolveEscalation {
  const ResolveEscalation(this.repository);
  final EscalationRepository repository;
  Future<Result<Unit>> call({
    required Task task,
    required String actorId,
    required String reason,
  }) => repository.resolveEscalation(
    orgId: task.orgId,
    taskId: task.id,
    actorId: actorId,
    reason: reason.trim(),
    expectedVersion: task.version,
  );
}

TaskActivity _activity({
  required Task task,
  required String actorId,
  required ActivityType type,
  required DateTime now,
}) => TaskActivity(
  id: '${task.id}:${task.version + 1}:${type.name}',
  taskId: task.id,
  actorId: actorId,
  type: type,
  before: <String, Object?>{'version': task.version},
  after: <String, Object?>{'version': task.version + 1},
  createdAt: now,
);

final class WatchMyTasks {
  const WatchMyTasks(this.repository);
  final TaskRepository repository;
  Stream<Result<List<Task>>> call(String orgId, String userId) =>
      repository.watchMyTasks(orgId, userId);
}

final class WatchDelegatedByMe {
  const WatchDelegatedByMe(this.repository);
  final TaskRepository repository;
  Stream<Result<List<Task>>> call(String orgId, String userId) =>
      repository.watchDelegatedByMe(orgId, userId);
}

final class WatchTeamTasks {
  const WatchTeamTasks(this.repository);
  final TaskRepository repository;
  Stream<Result<List<Task>>> call(String orgId, String teamId) =>
      repository.watchTeamTasks(orgId, teamId);
}

final class WatchTask {
  const WatchTask(this.repository);
  final TaskRepository repository;
  Stream<Result<Task>> call(String orgId, String taskId) =>
      repository.watchTask(orgId, taskId);
}

final class SearchTasks {
  const SearchTasks(this.repository);
  final TaskRepository repository;
  Future<Result<Page<Task>>> call({
    required String orgId,
    required String query,
    String? cursor,
  }) => repository.searchTasks(
    orgId: orgId,
    query: query.trim(),
    limit: 25,
    cursor: cursor,
  );
}
