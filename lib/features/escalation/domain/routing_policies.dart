import 'package:relay/features/organization/domain/organization_models.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

final class DelegateRouter {
  const DelegateRouter({this.maxDepth = 2});

  final int maxDepth;

  String? route({
    required String requestedUserId,
    required Map<String, Membership> memberships,
  }) {
    var current = requestedUserId;
    final seen = <String>{};
    for (var depth = 0; depth <= maxDepth; depth++) {
      if (!seen.add(current)) return null;
      final member = memberships[current];
      if (member == null || member.status == MembershipStatus.suspended) {
        return null;
      }
      if (member.status != MembershipStatus.away) return current;
      final delegate = member.delegateUserId;
      if (delegate == null) return null;
      current = delegate;
    }
    return null;
  }
}

final class EscalationTargetResolver {
  const EscalationTargetResolver();

  List<String> resolve({
    required Membership assignee,
    required Map<String, Membership> memberships,
    required String? teamLeadId,
    required String ownerId,
    String? specificUserId,
    MemberRole? role,
  }) {
    final targets = <String>{};
    if (specificUserId != null && _active(specificUserId, memberships)) {
      targets.add(specificUserId);
    }
    if (role != null) {
      targets.addAll(
        memberships.values
            .where(
              (member) =>
                  member.role == role &&
                  member.status != MembershipStatus.suspended,
            )
            .map((member) => member.userId),
      );
    }
    var managerId = assignee.managerId;
    final seen = <String>{assignee.userId};
    while (managerId != null && seen.add(managerId)) {
      if (_active(managerId, memberships)) {
        targets.add(managerId);
        break;
      }
      managerId = memberships[managerId]?.managerId;
    }
    if (targets.isEmpty &&
        teamLeadId != null &&
        _active(teamLeadId, memberships)) {
      targets.add(teamLeadId);
    }
    if (targets.isEmpty) {
      final admin = memberships.values
          .where(
            (member) =>
                member.role == MemberRole.admin &&
                member.status != MembershipStatus.suspended,
          )
          .map((member) => member.userId)
          .firstOrNull;
      if (admin != null) targets.add(admin);
    }
    if (targets.isEmpty) targets.add(ownerId);
    return targets.toList(growable: false);
  }

  bool _active(String id, Map<String, Membership> memberships) =>
      memberships[id]?.status != MembershipStatus.suspended;
}

extension _FirstOrNull<T> on Iterable<T> {
  T? get firstOrNull => isEmpty ? null : first;
}
