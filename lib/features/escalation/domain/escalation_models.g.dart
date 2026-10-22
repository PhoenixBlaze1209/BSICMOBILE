// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'escalation_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EscalationStep _$EscalationStepFromJson(Map<String, dynamic> json) =>
    _EscalationStep(
      level: (json['level'] as num).toInt(),
      triggerCondition: $enumDecode(
        _$EscalationTriggerEnumMap,
        json['triggerCondition'],
      ),
      afterDuration: Duration(
        microseconds: (json['afterDuration'] as num).toInt(),
      ),
      notifyTargets: (json['notifyTargets'] as List<dynamic>)
          .map((e) => $enumDecode(_$EscalationTargetTypeEnumMap, e))
          .toList(),
      action: $enumDecode(_$EscalationActionEnumMap, json['action']),
      maxRepeats: (json['maxRepeats'] as num).toInt(),
      repeatEvery: json['repeatEvery'] == null
          ? null
          : Duration(microseconds: (json['repeatEvery'] as num).toInt()),
      specificUserId: json['specificUserId'] as String?,
      targetRole: $enumDecodeNullable(_$MemberRoleEnumMap, json['targetRole']),
    );

Map<String, dynamic> _$EscalationStepToJson(
  _EscalationStep instance,
) => <String, dynamic>{
  'level': instance.level,
  'triggerCondition': _$EscalationTriggerEnumMap[instance.triggerCondition]!,
  'afterDuration': instance.afterDuration.inMicroseconds,
  'notifyTargets': instance.notifyTargets
      .map((e) => _$EscalationTargetTypeEnumMap[e]!)
      .toList(),
  'action': _$EscalationActionEnumMap[instance.action]!,
  'maxRepeats': instance.maxRepeats,
  'repeatEvery': instance.repeatEvery?.inMicroseconds,
  'specificUserId': instance.specificUserId,
  'targetRole': _$MemberRoleEnumMap[instance.targetRole],
};

const _$EscalationTriggerEnumMap = {
  EscalationTrigger.unacknowledged: 'unacknowledged',
  EscalationTrigger.overdue: 'overdue',
  EscalationTrigger.slaBreach: 'slaBreach',
  EscalationTrigger.stalled: 'stalled',
  EscalationTrigger.blockedTooLong: 'blockedTooLong',
  EscalationTrigger.manual: 'manual',
};

const _$EscalationTargetTypeEnumMap = {
  EscalationTargetType.assigneeManager: 'assigneeManager',
  EscalationTargetType.teamLead: 'teamLead',
  EscalationTargetType.specificUser: 'specificUser',
  EscalationTargetType.role: 'role',
};

const _$EscalationActionEnumMap = {
  EscalationAction.notify: 'notify',
  EscalationAction.reassign: 'reassign',
  EscalationAction.raisePriority: 'raisePriority',
  EscalationAction.notifyAndReassign: 'notifyAndReassign',
};

const _$MemberRoleEnumMap = {
  MemberRole.owner: 'owner',
  MemberRole.admin: 'admin',
  MemberRole.manager: 'manager',
  MemberRole.member: 'member',
  MemberRole.viewer: 'viewer',
};

_EscalationPolicy _$EscalationPolicyFromJson(Map<String, dynamic> json) =>
    _EscalationPolicy(
      id: json['id'] as String,
      orgId: json['orgId'] as String,
      name: json['name'] as String,
      steps: (json['steps'] as List<dynamic>)
          .map((e) => EscalationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
      priorities: (json['priorities'] as List<dynamic>)
          .map((e) => $enumDecode(_$PriorityEnumMap, e))
          .toSet(),
      teamIds: (json['teamIds'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
      isDefault: json['isDefault'] as bool,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$EscalationPolicyToJson(
  _EscalationPolicy instance,
) => <String, dynamic>{
  'id': instance.id,
  'orgId': instance.orgId,
  'name': instance.name,
  'steps': instance.steps,
  'priorities': instance.priorities.map((e) => _$PriorityEnumMap[e]!).toList(),
  'teamIds': instance.teamIds.toList(),
  'isDefault': instance.isDefault,
  'active': instance.active,
};

const _$PriorityEnumMap = {
  Priority.critical: 'critical',
  Priority.high: 'high',
  Priority.medium: 'medium',
  Priority.low: 'low',
};

_EscalationEvent _$EscalationEventFromJson(Map<String, dynamic> json) =>
    _EscalationEvent(
      id: json['id'] as String,
      taskId: json['taskId'] as String,
      fromLevel: (json['fromLevel'] as num).toInt(),
      toLevel: (json['toLevel'] as num).toInt(),
      reason: $enumDecode(_$EscalationTriggerEnumMap, json['reason']),
      triggeredBy: json['triggeredBy'] as String,
      notifiedUserIds: (json['notifiedUserIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      repeat: (json['repeat'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$EscalationEventToJson(_EscalationEvent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskId': instance.taskId,
      'fromLevel': instance.fromLevel,
      'toLevel': instance.toLevel,
      'reason': _$EscalationTriggerEnumMap[instance.reason]!,
      'triggeredBy': instance.triggeredBy,
      'notifiedUserIds': instance.notifiedUserIds,
      'createdAt': instance.createdAt.toIso8601String(),
      'repeat': instance.repeat,
    };
