// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WorkingHours _$WorkingHoursFromJson(
  Map<String, dynamic> json,
) => _WorkingHours(
  intervalsByWeekday: (json['intervalsByWeekday'] as Map<String, dynamic>).map(
    (k, e) => MapEntry(
      int.parse(k),
      (e as List<dynamic>)
          .map((e) => WorkingInterval.fromJson(e as Map<String, dynamic>))
          .toList(),
    ),
  ),
);

Map<String, dynamic> _$WorkingHoursToJson(_WorkingHours instance) =>
    <String, dynamic>{
      'intervalsByWeekday': instance.intervalsByWeekday.map(
        (k, e) => MapEntry(k.toString(), e),
      ),
    };

_WorkingInterval _$WorkingIntervalFromJson(Map<String, dynamic> json) =>
    _WorkingInterval(
      startMinute: (json['startMinute'] as num).toInt(),
      endMinute: (json['endMinute'] as num).toInt(),
    );

Map<String, dynamic> _$WorkingIntervalToJson(_WorkingInterval instance) =>
    <String, dynamic>{
      'startMinute': instance.startMinute,
      'endMinute': instance.endMinute,
    };

_Membership _$MembershipFromJson(Map<String, dynamic> json) => _Membership(
  userId: json['userId'] as String,
  orgId: json['orgId'] as String,
  teamIds: (json['teamIds'] as List<dynamic>).map((e) => e as String).toList(),
  role: $enumDecode(_$MemberRoleEnumMap, json['role']),
  status: $enumDecode(_$MembershipStatusEnumMap, json['status']),
  managerId: json['managerId'] as String?,
  delegateUserId: json['delegateUserId'] as String?,
);

Map<String, dynamic> _$MembershipToJson(_Membership instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'orgId': instance.orgId,
      'teamIds': instance.teamIds,
      'role': _$MemberRoleEnumMap[instance.role]!,
      'status': _$MembershipStatusEnumMap[instance.status]!,
      'managerId': instance.managerId,
      'delegateUserId': instance.delegateUserId,
    };

const _$MemberRoleEnumMap = {
  MemberRole.owner: 'owner',
  MemberRole.admin: 'admin',
  MemberRole.manager: 'manager',
  MemberRole.member: 'member',
  MemberRole.viewer: 'viewer',
};

const _$MembershipStatusEnumMap = {
  MembershipStatus.active: 'active',
  MembershipStatus.suspended: 'suspended',
  MembershipStatus.away: 'away',
};

_Organization _$OrganizationFromJson(Map<String, dynamic> json) =>
    _Organization(
      id: json['id'] as String,
      name: json['name'] as String,
      ownerId: json['ownerId'] as String,
      defaultEscalationPolicyId: json['defaultEscalationPolicyId'] as String,
      settings:
          json['settings'] as Map<String, dynamic>? ??
          const <String, Object?>{},
    );

Map<String, dynamic> _$OrganizationToJson(_Organization instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ownerId': instance.ownerId,
      'defaultEscalationPolicyId': instance.defaultEscalationPolicyId,
      'settings': instance.settings,
    };
