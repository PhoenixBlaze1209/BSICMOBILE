enum Priority { critical, high, medium, low }

extension PriorityValue on Priority {
  int get weight => switch (this) {
    Priority.critical => 4,
    Priority.high => 3,
    Priority.medium => 2,
    Priority.low => 1,
  };

  Duration get acceptanceWindow => switch (this) {
    Priority.critical => const Duration(minutes: 15),
    Priority.high => const Duration(hours: 1),
    Priority.medium => const Duration(hours: 4),
    Priority.low => const Duration(hours: 24),
  };
}

enum TaskStatus {
  draft,
  open,
  assigned,
  accepted,
  inProgress,
  blocked,
  inReview,
  done,
  cancelled,
  declined,
}

enum MemberRole { owner, admin, manager, member, viewer }

enum MembershipStatus { active, suspended, away }

enum SyncState { synced, pending, failed }

enum ActivityType {
  created,
  updated,
  assigned,
  reassigned,
  statusChanged,
  priorityChanged,
  commented,
  escalated,
  deEscalated,
  deleted,
  reopened,
}
