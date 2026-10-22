import 'package:relay/features/tasks/domain/task.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

enum Permission {
  read,
  createTask,
  editTask,
  assignTask,
  forceTransition,
  lowerPriority,
  manualEscalate,
  managePolicy,
  manageMembers,
  deleteOrganization,
}

final class PermissionPolicy {
  const PermissionPolicy();

  bool allows({
    required Permission permission,
    required MemberRole role,
    required String actorId,
    Task? task,
    bool managesTeam = false,
  }) {
    if (role == MemberRole.viewer) return permission == Permission.read;
    final elevated = role == MemberRole.owner || role == MemberRole.admin;
    final manager = elevated || (role == MemberRole.manager && managesTeam);
    final ownsTask = task?.creatorId == actorId || task?.assigneeId == actorId;
    return switch (permission) {
      Permission.read || Permission.createTask => true,
      Permission.editTask => elevated || manager || ownsTask,
      Permission.assignTask => elevated || manager || task?.assigneeId == null,
      Permission.forceTransition => manager,
      Permission.lowerPriority => manager || task?.creatorId == actorId,
      Permission.manualEscalate => manager || ownsTask,
      Permission.managePolicy => elevated,
      Permission.manageMembers => elevated || manager,
      Permission.deleteOrganization => role == MemberRole.owner,
    };
  }
}
