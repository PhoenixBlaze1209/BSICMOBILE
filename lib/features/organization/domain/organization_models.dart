import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:relay/features/tasks/domain/task_types.dart';

part 'organization_models.freezed.dart';
part 'organization_models.g.dart';

@freezed
abstract class WorkingHours with _$WorkingHours {
  const factory WorkingHours({
    required Map<int, List<WorkingInterval>> intervalsByWeekday,
  }) = _WorkingHours;

  factory WorkingHours.fromJson(Map<String, Object?> json) =>
      _$WorkingHoursFromJson(json);
}

@freezed
abstract class WorkingInterval with _$WorkingInterval {
  const factory WorkingInterval({
    required int startMinute,
    required int endMinute,
  }) = _WorkingInterval;

  factory WorkingInterval.fromJson(Map<String, Object?> json) =>
      _$WorkingIntervalFromJson(json);
}

@freezed
abstract class Membership with _$Membership {
  const factory Membership({
    required String userId,
    required String orgId,
    required List<String> teamIds,
    required MemberRole role,
    required MembershipStatus status,
    String? managerId,
    String? delegateUserId,
  }) = _Membership;

  factory Membership.fromJson(Map<String, Object?> json) =>
      _$MembershipFromJson(json);
}

@freezed
abstract class Organization with _$Organization {
  const factory Organization({
    required String id,
    required String name,
    required String ownerId,
    required String defaultEscalationPolicyId,
    @Default(<String, Object?>{}) Map<String, Object?> settings,
  }) = _Organization;

  factory Organization.fromJson(Map<String, Object?> json) =>
      _$OrganizationFromJson(json);
}
