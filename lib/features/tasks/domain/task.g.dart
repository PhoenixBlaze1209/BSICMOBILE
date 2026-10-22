// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Task _$TaskFromJson(Map<String, dynamic> json) => _Task(
  id: json['id'] as String,
  orgId: json['orgId'] as String,
  title: json['title'] as String,
  description: json['description'] as String,
  creatorId: json['creatorId'] as String,
  watcherIds: (json['watcherIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  priority: $enumDecode(_$PriorityEnumMap, json['priority']),
  status: $enumDecode(_$TaskStatusEnumMap, json['status']),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  subtaskIds: (json['subtaskIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  blockedByTaskIds: (json['blockedByTaskIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  attachmentIds: (json['attachmentIds'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  escalationLevel: (json['escalationLevel'] as num).toInt(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  version: (json['version'] as num).toInt(),
  assigneeId: json['assigneeId'] as String?,
  teamId: json['teamId'] as String?,
  dueAt: json['dueAt'] == null ? null : DateTime.parse(json['dueAt'] as String),
  startAt: json['startAt'] == null
      ? null
      : DateTime.parse(json['startAt'] as String),
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt(),
  parentTaskId: json['parentTaskId'] as String?,
  escalationPolicyId: json['escalationPolicyId'] as String?,
  slaDeadlineAt: json['slaDeadlineAt'] == null
      ? null
      : DateTime.parse(json['slaDeadlineAt'] as String),
  snoozedUntil: json['snoozedUntil'] == null
      ? null
      : DateTime.parse(json['snoozedUntil'] as String),
  completedAt: json['completedAt'] == null
      ? null
      : DateTime.parse(json['completedAt'] as String),
  assignedAt: json['assignedAt'] == null
      ? null
      : DateTime.parse(json['assignedAt'] as String),
  blockedAt: json['blockedAt'] == null
      ? null
      : DateTime.parse(json['blockedAt'] as String),
  lastActivityAt: json['lastActivityAt'] == null
      ? null
      : DateTime.parse(json['lastActivityAt'] as String),
  reassignmentCount: (json['reassignmentCount'] as num?)?.toInt() ?? 0,
  needsAttention: json['needsAttention'] as bool? ?? false,
  isDeleted: json['isDeleted'] as bool? ?? false,
  syncState:
      $enumDecodeNullable(_$SyncStateEnumMap, json['syncState']) ??
      SyncState.synced,
);

Map<String, dynamic> _$TaskToJson(_Task instance) => <String, dynamic>{
  'id': instance.id,
  'orgId': instance.orgId,
  'title': instance.title,
  'description': instance.description,
  'creatorId': instance.creatorId,
  'watcherIds': instance.watcherIds,
  'priority': _$PriorityEnumMap[instance.priority]!,
  'status': _$TaskStatusEnumMap[instance.status]!,
  'tags': instance.tags,
  'subtaskIds': instance.subtaskIds,
  'blockedByTaskIds': instance.blockedByTaskIds,
  'attachmentIds': instance.attachmentIds,
  'escalationLevel': instance.escalationLevel,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'version': instance.version,
  'assigneeId': instance.assigneeId,
  'teamId': instance.teamId,
  'dueAt': instance.dueAt?.toIso8601String(),
  'startAt': instance.startAt?.toIso8601String(),
  'estimatedMinutes': instance.estimatedMinutes,
  'parentTaskId': instance.parentTaskId,
  'escalationPolicyId': instance.escalationPolicyId,
  'slaDeadlineAt': instance.slaDeadlineAt?.toIso8601String(),
  'snoozedUntil': instance.snoozedUntil?.toIso8601String(),
  'completedAt': instance.completedAt?.toIso8601String(),
  'assignedAt': instance.assignedAt?.toIso8601String(),
  'blockedAt': instance.blockedAt?.toIso8601String(),
  'lastActivityAt': instance.lastActivityAt?.toIso8601String(),
  'reassignmentCount': instance.reassignmentCount,
  'needsAttention': instance.needsAttention,
  'isDeleted': instance.isDeleted,
  'syncState': _$SyncStateEnumMap[instance.syncState]!,
};

const _$PriorityEnumMap = {
  Priority.critical: 'critical',
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
};

const _$TaskStatusEnumMap = {
  TaskStatus.draft: 'draft',
  TaskStatus.open: 'open',
  TaskStatus.assigned: 'assigned',
  TaskStatus.accepted: 'accepted',
  TaskStatus.inProgress: 'inProgress',
  TaskStatus.blocked: 'blocked',
  TaskStatus.inReview: 'inReview',
  TaskStatus.done: 'done',
  TaskStatus.cancelled: 'cancelled',
  TaskStatus.declined: 'declined',
};

const _$SyncStateEnumMap = {
  SyncState.synced: 'synced',
  SyncState.pending: 'pending',
  SyncState.failed: 'failed',
};

_TaskActivity _$TaskActivityFromJson(Map<String, dynamic> json) =>
    _TaskActivity(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      actorId: json['actorId'] as String,
      type: $enumDecode(_$ActivityTypeEnumMap, json['type']),
      before: json['before'] as Map<String, dynamic>,
      after: json['after'] as Map<String, dynamic>,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$TaskActivityToJson(_TaskActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'actorId': instance.actorId,
      'type': _$ActivityTypeEnumMap[instance.type]!,
      'before': instance.before,
      'after': instance.after,
      'createdAt': instance.createdAt.toIso8601String(),
    };

const _$ActivityTypeEnumMap = {
  ActivityType.created: 'created',
  ActivityType.updated: 'updated',
  ActivityType.assigned: 'assigned',
  ActivityType.reassigned: 'reassigned',
  ActivityType.statusChanged: 'statusChanged',
  ActivityType.priorityChanged: 'priorityChanged',
  ActivityType.commented: 'commented',
  ActivityType.escalated: 'escalated',
  ActivityType.deEscalated: 'deEscalated',
  ActivityType.deleted: 'deleted',
  ActivityType.reopened: 'reopened',
};
