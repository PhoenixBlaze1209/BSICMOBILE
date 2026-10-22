// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Task {

 String get id; String get orgId; String get title; String get description; String get creatorId; List<String> get watcherIds; Priority get priority; TaskStatus get status; List<String> get tags; List<String> get subtaskIds; List<String> get blockedByTaskIds; List<String> get attachmentIds; int get escalationLevel; DateTime get createdAt; DateTime get updatedAt; int get version; String? get assigneeId; String? get teamId; DateTime? get dueAt; DateTime? get startAt; int? get estimatedMinutes; String? get parentTaskId; String? get escalationPolicyId; DateTime? get slaDeadlineAt; DateTime? get snoozedUntil; DateTime? get completedAt; DateTime? get assignedAt; DateTime? get blockedAt; DateTime? get lastActivityAt; int get reassignmentCount; bool get needsAttention; bool get isDeleted; SyncState get syncState;
/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskCopyWith<Task> get copyWith => _$TaskCopyWithImpl<Task>(this as Task, _$identity);

  /// Serializes this Task to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Task;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Task&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orgId, _this.orgId) || other.orgId == _this.orgId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.description, _this.description) || other.description == _this.description)&&(identical(other.creatorId, _this.creatorId) || other.creatorId == _this.creatorId)&&const DeepCollectionEquality().equals(other.watcherIds, _this.watcherIds)&&(identical(other.priority, _this.priority) || other.priority == _this.priority)&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&const DeepCollectionEquality().equals(other.subtaskIds, _this.subtaskIds)&&const DeepCollectionEquality().equals(other.blockedByTaskIds, _this.blockedByTaskIds)&&const DeepCollectionEquality().equals(other.attachmentIds, _this.attachmentIds)&&(identical(other.escalationLevel, _this.escalationLevel) || other.escalationLevel == _this.escalationLevel)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.version, _this.version) || other.version == _this.version)&&(identical(other.assigneeId, _this.assigneeId) || other.assigneeId == _this.assigneeId)&&(identical(other.teamId, _this.teamId) || other.teamId == _this.teamId)&&(identical(other.dueAt, _this.dueAt) || other.dueAt == _this.dueAt)&&(identical(other.startAt, _this.startAt) || other.startAt == _this.startAt)&&(identical(other.estimatedMinutes, _this.estimatedMinutes) || other.estimatedMinutes == _this.estimatedMinutes)&&(identical(other.parentTaskId, _this.parentTaskId) || other.parentTaskId == _this.parentTaskId)&&(identical(other.escalationPolicyId, _this.escalationPolicyId) || other.escalationPolicyId == _this.escalationPolicyId)&&(identical(other.slaDeadlineAt, _this.slaDeadlineAt) || other.slaDeadlineAt == _this.slaDeadlineAt)&&(identical(other.snoozedUntil, _this.snoozedUntil) || other.snoozedUntil == _this.snoozedUntil)&&(identical(other.completedAt, _this.completedAt) || other.completedAt == _this.completedAt)&&(identical(other.assignedAt, _this.assignedAt) || other.assignedAt == _this.assignedAt)&&(identical(other.blockedAt, _this.blockedAt) || other.blockedAt == _this.blockedAt)&&(identical(other.lastActivityAt, _this.lastActivityAt) || other.lastActivityAt == _this.lastActivityAt)&&(identical(other.reassignmentCount, _this.reassignmentCount) || other.reassignmentCount == _this.reassignmentCount)&&(identical(other.needsAttention, _this.needsAttention) || other.needsAttention == _this.needsAttention)&&(identical(other.isDeleted, _this.isDeleted) || other.isDeleted == _this.isDeleted)&&(identical(other.syncState, _this.syncState) || other.syncState == _this.syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Task;
  return Object.hashAll([runtimeType,_this.id,_this.orgId,_this.title,_this.description,_this.creatorId,const DeepCollectionEquality().hash(_this.watcherIds),_this.priority,_this.status,const DeepCollectionEquality().hash(_this.tags),const DeepCollectionEquality().hash(_this.subtaskIds),const DeepCollectionEquality().hash(_this.blockedByTaskIds),const DeepCollectionEquality().hash(_this.attachmentIds),_this.escalationLevel,_this.createdAt,_this.updatedAt,_this.version,_this.assigneeId,_this.teamId,_this.dueAt,_this.startAt,_this.estimatedMinutes,_this.parentTaskId,_this.escalationPolicyId,_this.slaDeadlineAt,_this.snoozedUntil,_this.completedAt,_this.assignedAt,_this.blockedAt,_this.lastActivityAt,_this.reassignmentCount,_this.needsAttention,_this.isDeleted,_this.syncState]);
}

@override
String toString() {
  final _this = this as Task;
  return 'Task(id: ${_this.id}, orgId: ${_this.orgId}, title: ${_this.title}, description: ${_this.description}, creatorId: ${_this.creatorId}, watcherIds: ${_this.watcherIds}, priority: ${_this.priority}, status: ${_this.status}, tags: ${_this.tags}, subtaskIds: ${_this.subtaskIds}, blockedByTaskIds: ${_this.blockedByTaskIds}, attachmentIds: ${_this.attachmentIds}, escalationLevel: ${_this.escalationLevel}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, version: ${_this.version}, assigneeId: ${_this.assigneeId}, teamId: ${_this.teamId}, dueAt: ${_this.dueAt}, startAt: ${_this.startAt}, estimatedMinutes: ${_this.estimatedMinutes}, parentTaskId: ${_this.parentTaskId}, escalationPolicyId: ${_this.escalationPolicyId}, slaDeadlineAt: ${_this.slaDeadlineAt}, snoozedUntil: ${_this.snoozedUntil}, completedAt: ${_this.completedAt}, assignedAt: ${_this.assignedAt}, blockedAt: ${_this.blockedAt}, lastActivityAt: ${_this.lastActivityAt}, reassignmentCount: ${_this.reassignmentCount}, needsAttention: ${_this.needsAttention}, isDeleted: ${_this.isDeleted}, syncState: ${_this.syncState})';
}


}

/// @nodoc
abstract mixin class $TaskCopyWith<$Res>  {
  factory $TaskCopyWith(Task value, $Res Function(Task) _then) = _$TaskCopyWithImpl;
@useResult
$Res call({
 String id, String orgId, String title, String description, String creatorId, List<String> watcherIds, Priority priority, TaskStatus status, List<String> tags, List<String> subtaskIds, List<String> blockedByTaskIds, List<String> attachmentIds, int escalationLevel, DateTime createdAt, DateTime updatedAt, int version, String? assigneeId, String? teamId, DateTime? dueAt, DateTime? startAt, int? estimatedMinutes, String? parentTaskId, String? escalationPolicyId, DateTime? slaDeadlineAt, DateTime? snoozedUntil, DateTime? completedAt, DateTime? assignedAt, DateTime? blockedAt, DateTime? lastActivityAt, int reassignmentCount, bool needsAttention, bool isDeleted, SyncState syncState
});




}
/// @nodoc
class _$TaskCopyWithImpl<$Res>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._self, this._then);

  final Task _self;
  final $Res Function(Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? title = null,Object? description = null,Object? creatorId = null,Object? watcherIds = null,Object? priority = null,Object? status = null,Object? tags = null,Object? subtaskIds = null,Object? blockedByTaskIds = null,Object? attachmentIds = null,Object? escalationLevel = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,Object? assigneeId = freezed,Object? teamId = freezed,Object? dueAt = freezed,Object? startAt = freezed,Object? estimatedMinutes = freezed,Object? parentTaskId = freezed,Object? escalationPolicyId = freezed,Object? slaDeadlineAt = freezed,Object? snoozedUntil = freezed,Object? completedAt = freezed,Object? assignedAt = freezed,Object? blockedAt = freezed,Object? lastActivityAt = freezed,Object? reassignmentCount = null,Object? needsAttention = null,Object? isDeleted = null,Object? syncState = null,}) {
  return _then(Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,watcherIds: null == watcherIds ? _self.watcherIds : watcherIds // ignore: cast_nullable_to_non_nullable
as List<String>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as Priority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,subtaskIds: null == subtaskIds ? _self.subtaskIds : subtaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,blockedByTaskIds: null == blockedByTaskIds ? _self.blockedByTaskIds : blockedByTaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,attachmentIds: null == attachmentIds ? _self.attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<String>,escalationLevel: null == escalationLevel ? _self.escalationLevel : escalationLevel // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,parentTaskId: freezed == parentTaskId ? _self.parentTaskId : parentTaskId // ignore: cast_nullable_to_non_nullable
as String?,escalationPolicyId: freezed == escalationPolicyId ? _self.escalationPolicyId : escalationPolicyId // ignore: cast_nullable_to_non_nullable
as String?,slaDeadlineAt: freezed == slaDeadlineAt ? _self.slaDeadlineAt : slaDeadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,snoozedUntil: freezed == snoozedUntil ? _self.snoozedUntil : snoozedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,blockedAt: freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reassignmentCount: null == reassignmentCount ? _self.reassignmentCount : reassignmentCount // ignore: cast_nullable_to_non_nullable
as int,needsAttention: null == needsAttention ? _self.needsAttention : needsAttention // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}

}


/// Adds pattern-matching-related methods to [Task].
extension TaskPatterns on Task {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Task value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Task value)  $default,){
final _that = this;
switch (_that) {
case _Task():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Task value)?  $default,){
final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orgId,  String title,  String description,  String creatorId,  List<String> watcherIds,  Priority priority,  TaskStatus status,  List<String> tags,  List<String> subtaskIds,  List<String> blockedByTaskIds,  List<String> attachmentIds,  int escalationLevel,  DateTime createdAt,  DateTime updatedAt,  int version,  String? assigneeId,  String? teamId,  DateTime? dueAt,  DateTime? startAt,  int? estimatedMinutes,  String? parentTaskId,  String? escalationPolicyId,  DateTime? slaDeadlineAt,  DateTime? snoozedUntil,  DateTime? completedAt,  DateTime? assignedAt,  DateTime? blockedAt,  DateTime? lastActivityAt,  int reassignmentCount,  bool needsAttention,  bool isDeleted,  SyncState syncState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.orgId,_that.title,_that.description,_that.creatorId,_that.watcherIds,_that.priority,_that.status,_that.tags,_that.subtaskIds,_that.blockedByTaskIds,_that.attachmentIds,_that.escalationLevel,_that.createdAt,_that.updatedAt,_that.version,_that.assigneeId,_that.teamId,_that.dueAt,_that.startAt,_that.estimatedMinutes,_that.parentTaskId,_that.escalationPolicyId,_that.slaDeadlineAt,_that.snoozedUntil,_that.completedAt,_that.assignedAt,_that.blockedAt,_that.lastActivityAt,_that.reassignmentCount,_that.needsAttention,_that.isDeleted,_that.syncState);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orgId,  String title,  String description,  String creatorId,  List<String> watcherIds,  Priority priority,  TaskStatus status,  List<String> tags,  List<String> subtaskIds,  List<String> blockedByTaskIds,  List<String> attachmentIds,  int escalationLevel,  DateTime createdAt,  DateTime updatedAt,  int version,  String? assigneeId,  String? teamId,  DateTime? dueAt,  DateTime? startAt,  int? estimatedMinutes,  String? parentTaskId,  String? escalationPolicyId,  DateTime? slaDeadlineAt,  DateTime? snoozedUntil,  DateTime? completedAt,  DateTime? assignedAt,  DateTime? blockedAt,  DateTime? lastActivityAt,  int reassignmentCount,  bool needsAttention,  bool isDeleted,  SyncState syncState)  $default,) {final _that = this;
switch (_that) {
case _Task():
return $default(_that.id,_that.orgId,_that.title,_that.description,_that.creatorId,_that.watcherIds,_that.priority,_that.status,_that.tags,_that.subtaskIds,_that.blockedByTaskIds,_that.attachmentIds,_that.escalationLevel,_that.createdAt,_that.updatedAt,_that.version,_that.assigneeId,_that.teamId,_that.dueAt,_that.startAt,_that.estimatedMinutes,_that.parentTaskId,_that.escalationPolicyId,_that.slaDeadlineAt,_that.snoozedUntil,_that.completedAt,_that.assignedAt,_that.blockedAt,_that.lastActivityAt,_that.reassignmentCount,_that.needsAttention,_that.isDeleted,_that.syncState);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orgId,  String title,  String description,  String creatorId,  List<String> watcherIds,  Priority priority,  TaskStatus status,  List<String> tags,  List<String> subtaskIds,  List<String> blockedByTaskIds,  List<String> attachmentIds,  int escalationLevel,  DateTime createdAt,  DateTime updatedAt,  int version,  String? assigneeId,  String? teamId,  DateTime? dueAt,  DateTime? startAt,  int? estimatedMinutes,  String? parentTaskId,  String? escalationPolicyId,  DateTime? slaDeadlineAt,  DateTime? snoozedUntil,  DateTime? completedAt,  DateTime? assignedAt,  DateTime? blockedAt,  DateTime? lastActivityAt,  int reassignmentCount,  bool needsAttention,  bool isDeleted,  SyncState syncState)?  $default,) {final _that = this;
switch (_that) {
case _Task() when $default != null:
return $default(_that.id,_that.orgId,_that.title,_that.description,_that.creatorId,_that.watcherIds,_that.priority,_that.status,_that.tags,_that.subtaskIds,_that.blockedByTaskIds,_that.attachmentIds,_that.escalationLevel,_that.createdAt,_that.updatedAt,_that.version,_that.assigneeId,_that.teamId,_that.dueAt,_that.startAt,_that.estimatedMinutes,_that.parentTaskId,_that.escalationPolicyId,_that.slaDeadlineAt,_that.snoozedUntil,_that.completedAt,_that.assignedAt,_that.blockedAt,_that.lastActivityAt,_that.reassignmentCount,_that.needsAttention,_that.isDeleted,_that.syncState);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Task implements Task {
  const _Task({required this.id, required this.orgId, required this.title, required this.description, required this.creatorId, required  List<String> watcherIds, required this.priority, required this.status, required  List<String> tags, required  List<String> subtaskIds, required  List<String> blockedByTaskIds, required  List<String> attachmentIds, required this.escalationLevel, required this.createdAt, required this.updatedAt, required this.version, this.assigneeId, this.teamId, this.dueAt, this.startAt, this.estimatedMinutes, this.parentTaskId, this.escalationPolicyId, this.slaDeadlineAt, this.snoozedUntil, this.completedAt, this.assignedAt, this.blockedAt, this.lastActivityAt, this.reassignmentCount = 0, this.needsAttention = false, this.isDeleted = false, this.syncState = SyncState.synced}): _watcherIds = watcherIds,_tags = tags,_subtaskIds = subtaskIds,_blockedByTaskIds = blockedByTaskIds,_attachmentIds = attachmentIds;
  factory _Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

@override final  String id;
@override final  String orgId;
@override final  String title;
@override final  String description;
@override final  String creatorId;
 final  List<String> _watcherIds;
@override List<String> get watcherIds {
  if (_watcherIds is EqualUnmodifiableListView) return _watcherIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_watcherIds);
}

@override final  Priority priority;
@override final  TaskStatus status;
 final  List<String> _tags;
@override List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

 final  List<String> _subtaskIds;
@override List<String> get subtaskIds {
  if (_subtaskIds is EqualUnmodifiableListView) return _subtaskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_subtaskIds);
}

 final  List<String> _blockedByTaskIds;
@override List<String> get blockedByTaskIds {
  if (_blockedByTaskIds is EqualUnmodifiableListView) return _blockedByTaskIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_blockedByTaskIds);
}

 final  List<String> _attachmentIds;
@override List<String> get attachmentIds {
  if (_attachmentIds is EqualUnmodifiableListView) return _attachmentIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentIds);
}

@override final  int escalationLevel;
@override final  DateTime createdAt;
@override final  DateTime updatedAt;
@override final  int version;
@override final  String? assigneeId;
@override final  String? teamId;
@override final  DateTime? dueAt;
@override final  DateTime? startAt;
@override final  int? estimatedMinutes;
@override final  String? parentTaskId;
@override final  String? escalationPolicyId;
@override final  DateTime? slaDeadlineAt;
@override final  DateTime? snoozedUntil;
@override final  DateTime? completedAt;
@override final  DateTime? assignedAt;
@override final  DateTime? blockedAt;
@override final  DateTime? lastActivityAt;
@override@JsonKey() final  int reassignmentCount;
@override@JsonKey() final  bool needsAttention;
@override@JsonKey() final  bool isDeleted;
@override@JsonKey() final  SyncState syncState;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskCopyWith<_Task> get copyWith => __$TaskCopyWithImpl<_Task>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Task&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.creatorId, creatorId) || other.creatorId == creatorId)&&const DeepCollectionEquality().equals(other.watcherIds, _watcherIds)&&(identical(other.priority, priority) || other.priority == priority)&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.tags, _tags)&&const DeepCollectionEquality().equals(other.subtaskIds, _subtaskIds)&&const DeepCollectionEquality().equals(other.blockedByTaskIds, _blockedByTaskIds)&&const DeepCollectionEquality().equals(other.attachmentIds, _attachmentIds)&&(identical(other.escalationLevel, escalationLevel) || other.escalationLevel == escalationLevel)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.version, version) || other.version == version)&&(identical(other.assigneeId, assigneeId) || other.assigneeId == assigneeId)&&(identical(other.teamId, teamId) || other.teamId == teamId)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.startAt, startAt) || other.startAt == startAt)&&(identical(other.estimatedMinutes, estimatedMinutes) || other.estimatedMinutes == estimatedMinutes)&&(identical(other.parentTaskId, parentTaskId) || other.parentTaskId == parentTaskId)&&(identical(other.escalationPolicyId, escalationPolicyId) || other.escalationPolicyId == escalationPolicyId)&&(identical(other.slaDeadlineAt, slaDeadlineAt) || other.slaDeadlineAt == slaDeadlineAt)&&(identical(other.snoozedUntil, snoozedUntil) || other.snoozedUntil == snoozedUntil)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.assignedAt, assignedAt) || other.assignedAt == assignedAt)&&(identical(other.blockedAt, blockedAt) || other.blockedAt == blockedAt)&&(identical(other.lastActivityAt, lastActivityAt) || other.lastActivityAt == lastActivityAt)&&(identical(other.reassignmentCount, reassignmentCount) || other.reassignmentCount == reassignmentCount)&&(identical(other.needsAttention, needsAttention) || other.needsAttention == needsAttention)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.syncState, syncState) || other.syncState == syncState));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hashAll([runtimeType,id,orgId,title,description,creatorId,const DeepCollectionEquality().hash(_watcherIds),priority,status,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_subtaskIds),const DeepCollectionEquality().hash(_blockedByTaskIds),const DeepCollectionEquality().hash(_attachmentIds),escalationLevel,createdAt,updatedAt,version,assigneeId,teamId,dueAt,startAt,estimatedMinutes,parentTaskId,escalationPolicyId,slaDeadlineAt,snoozedUntil,completedAt,assignedAt,blockedAt,lastActivityAt,reassignmentCount,needsAttention,isDeleted,syncState]);
}

@override
String toString() {
    return 'Task(id: $id, orgId: $orgId, title: $title, description: $description, creatorId: $creatorId, watcherIds: $watcherIds, priority: $priority, status: $status, tags: $tags, subtaskIds: $subtaskIds, blockedByTaskIds: $blockedByTaskIds, attachmentIds: $attachmentIds, escalationLevel: $escalationLevel, createdAt: $createdAt, updatedAt: $updatedAt, version: $version, assigneeId: $assigneeId, teamId: $teamId, dueAt: $dueAt, startAt: $startAt, estimatedMinutes: $estimatedMinutes, parentTaskId: $parentTaskId, escalationPolicyId: $escalationPolicyId, slaDeadlineAt: $slaDeadlineAt, snoozedUntil: $snoozedUntil, completedAt: $completedAt, assignedAt: $assignedAt, blockedAt: $blockedAt, lastActivityAt: $lastActivityAt, reassignmentCount: $reassignmentCount, needsAttention: $needsAttention, isDeleted: $isDeleted, syncState: $syncState)';
}


}

/// @nodoc
abstract mixin class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) _then) = __$TaskCopyWithImpl;
@override @useResult
$Res call({
 String id, String orgId, String title, String description, String creatorId, List<String> watcherIds, Priority priority, TaskStatus status, List<String> tags, List<String> subtaskIds, List<String> blockedByTaskIds, List<String> attachmentIds, int escalationLevel, DateTime createdAt, DateTime updatedAt, int version, String? assigneeId, String? teamId, DateTime? dueAt, DateTime? startAt, int? estimatedMinutes, String? parentTaskId, String? escalationPolicyId, DateTime? slaDeadlineAt, DateTime? snoozedUntil, DateTime? completedAt, DateTime? assignedAt, DateTime? blockedAt, DateTime? lastActivityAt, int reassignmentCount, bool needsAttention, bool isDeleted, SyncState syncState
});




}
/// @nodoc
class __$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(this._self, this._then);

  final _Task _self;
  final $Res Function(_Task) _then;

/// Create a copy of Task
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? title = null,Object? description = null,Object? creatorId = null,Object? watcherIds = null,Object? priority = null,Object? status = null,Object? tags = null,Object? subtaskIds = null,Object? blockedByTaskIds = null,Object? attachmentIds = null,Object? escalationLevel = null,Object? createdAt = null,Object? updatedAt = null,Object? version = null,Object? assigneeId = freezed,Object? teamId = freezed,Object? dueAt = freezed,Object? startAt = freezed,Object? estimatedMinutes = freezed,Object? parentTaskId = freezed,Object? escalationPolicyId = freezed,Object? slaDeadlineAt = freezed,Object? snoozedUntil = freezed,Object? completedAt = freezed,Object? assignedAt = freezed,Object? blockedAt = freezed,Object? lastActivityAt = freezed,Object? reassignmentCount = null,Object? needsAttention = null,Object? isDeleted = null,Object? syncState = null,}) {
  return _then(_Task(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,creatorId: null == creatorId ? _self.creatorId : creatorId // ignore: cast_nullable_to_non_nullable
as String,watcherIds: null == watcherIds ? _self._watcherIds : watcherIds // ignore: cast_nullable_to_non_nullable
as List<String>,priority: null == priority ? _self.priority : priority // ignore: cast_nullable_to_non_nullable
as Priority,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as TaskStatus,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,subtaskIds: null == subtaskIds ? _self._subtaskIds : subtaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,blockedByTaskIds: null == blockedByTaskIds ? _self._blockedByTaskIds : blockedByTaskIds // ignore: cast_nullable_to_non_nullable
as List<String>,attachmentIds: null == attachmentIds ? _self._attachmentIds : attachmentIds // ignore: cast_nullable_to_non_nullable
as List<String>,escalationLevel: null == escalationLevel ? _self.escalationLevel : escalationLevel // ignore: cast_nullable_to_non_nullable
as int,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,assigneeId: freezed == assigneeId ? _self.assigneeId : assigneeId // ignore: cast_nullable_to_non_nullable
as String?,teamId: freezed == teamId ? _self.teamId : teamId // ignore: cast_nullable_to_non_nullable
as String?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startAt: freezed == startAt ? _self.startAt : startAt // ignore: cast_nullable_to_non_nullable
as DateTime?,estimatedMinutes: freezed == estimatedMinutes ? _self.estimatedMinutes : estimatedMinutes // ignore: cast_nullable_to_non_nullable
as int?,parentTaskId: freezed == parentTaskId ? _self.parentTaskId : parentTaskId // ignore: cast_nullable_to_non_nullable
as String?,escalationPolicyId: freezed == escalationPolicyId ? _self.escalationPolicyId : escalationPolicyId // ignore: cast_nullable_to_non_nullable
as String?,slaDeadlineAt: freezed == slaDeadlineAt ? _self.slaDeadlineAt : slaDeadlineAt // ignore: cast_nullable_to_non_nullable
as DateTime?,snoozedUntil: freezed == snoozedUntil ? _self.snoozedUntil : snoozedUntil // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,assignedAt: freezed == assignedAt ? _self.assignedAt : assignedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,blockedAt: freezed == blockedAt ? _self.blockedAt : blockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,lastActivityAt: freezed == lastActivityAt ? _self.lastActivityAt : lastActivityAt // ignore: cast_nullable_to_non_nullable
as DateTime?,reassignmentCount: null == reassignmentCount ? _self.reassignmentCount : reassignmentCount // ignore: cast_nullable_to_non_nullable
as int,needsAttention: null == needsAttention ? _self.needsAttention : needsAttention // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,syncState: null == syncState ? _self.syncState : syncState // ignore: cast_nullable_to_non_nullable
as SyncState,
  ));
}


}


/// @nodoc
mixin _$TaskActivity {

 String get id; String get taskId; String get actorId; ActivityType get type; Map<String, Object?> get before; Map<String, Object?> get after; DateTime get createdAt;
/// Create a copy of TaskActivity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskActivityCopyWith<TaskActivity> get copyWith => _$TaskActivityCopyWithImpl<TaskActivity>(this as TaskActivity, _$identity);

  /// Serializes this TaskActivity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskActivity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskActivity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.actorId, _this.actorId) || other.actorId == _this.actorId)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.before, _this.before)&&const DeepCollectionEquality().equals(other.after, _this.after)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskActivity;
  return Object.hash(runtimeType,_this.id,_this.taskId,_this.actorId,_this.type,const DeepCollectionEquality().hash(_this.before),const DeepCollectionEquality().hash(_this.after),_this.createdAt);
}

@override
String toString() {
  final _this = this as TaskActivity;
  return 'TaskActivity(id: ${_this.id}, taskId: ${_this.taskId}, actorId: ${_this.actorId}, type: ${_this.type}, before: ${_this.before}, after: ${_this.after}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $TaskActivityCopyWith<$Res>  {
  factory $TaskActivityCopyWith(TaskActivity value, $Res Function(TaskActivity) _then) = _$TaskActivityCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, String actorId, ActivityType type, Map<String, Object?> before, Map<String, Object?> after, DateTime createdAt
});




}
/// @nodoc
class _$TaskActivityCopyWithImpl<$Res>
    implements $TaskActivityCopyWith<$Res> {
  _$TaskActivityCopyWithImpl(this._self, this._then);

  final TaskActivity _self;
  final $Res Function(TaskActivity) _then;

/// Create a copy of TaskActivity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? actorId = null,Object? type = null,Object? before = null,Object? after = null,Object? createdAt = null,}) {
  return _then(TaskActivity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,before: null == before ? _self.before : before // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,after: null == after ? _self.after : after // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskActivity].
extension TaskActivityPatterns on TaskActivity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskActivity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskActivity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskActivity value)  $default,){
final _that = this;
switch (_that) {
case _TaskActivity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskActivity value)?  $default,){
final _that = this;
switch (_that) {
case _TaskActivity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  String actorId,  ActivityType type,  Map<String, Object?> before,  Map<String, Object?> after,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskActivity() when $default != null:
return $default(_that.id,_that.taskId,_that.actorId,_that.type,_that.before,_that.after,_that.createdAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  String actorId,  ActivityType type,  Map<String, Object?> before,  Map<String, Object?> after,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _TaskActivity():
return $default(_that.id,_that.taskId,_that.actorId,_that.type,_that.before,_that.after,_that.createdAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  String actorId,  ActivityType type,  Map<String, Object?> before,  Map<String, Object?> after,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskActivity() when $default != null:
return $default(_that.id,_that.taskId,_that.actorId,_that.type,_that.before,_that.after,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskActivity implements TaskActivity {
  const _TaskActivity({required this.id, required this.taskId, required this.actorId, required this.type, required  Map<String, Object?> before, required  Map<String, Object?> after, required this.createdAt}): _before = before,_after = after;
  factory _TaskActivity.fromJson(Map<String, dynamic> json) => _$TaskActivityFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  String actorId;
@override final  ActivityType type;
 final  Map<String, Object?> _before;
@override Map<String, Object?> get before {
  if (_before is EqualUnmodifiableMapView) return _before;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_before);
}

 final  Map<String, Object?> _after;
@override Map<String, Object?> get after {
  if (_after is EqualUnmodifiableMapView) return _after;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_after);
}

@override final  DateTime createdAt;

/// Create a copy of TaskActivity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskActivityCopyWith<_TaskActivity> get copyWith => __$TaskActivityCopyWithImpl<_TaskActivity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskActivityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskActivity&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.actorId, actorId) || other.actorId == actorId)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.before, _before)&&const DeepCollectionEquality().equals(other.after, _after)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,taskId,actorId,type,const DeepCollectionEquality().hash(_before),const DeepCollectionEquality().hash(_after),createdAt);
}

@override
String toString() {
    return 'TaskActivity(id: $id, taskId: $taskId, actorId: $actorId, type: $type, before: $before, after: $after, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$TaskActivityCopyWith<$Res> implements $TaskActivityCopyWith<$Res> {
  factory _$TaskActivityCopyWith(_TaskActivity value, $Res Function(_TaskActivity) _then) = __$TaskActivityCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, String actorId, ActivityType type, Map<String, Object?> before, Map<String, Object?> after, DateTime createdAt
});




}
/// @nodoc
class __$TaskActivityCopyWithImpl<$Res>
    implements _$TaskActivityCopyWith<$Res> {
  __$TaskActivityCopyWithImpl(this._self, this._then);

  final _TaskActivity _self;
  final $Res Function(_TaskActivity) _then;

/// Create a copy of TaskActivity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? actorId = null,Object? type = null,Object? before = null,Object? after = null,Object? createdAt = null,}) {
  return _then(_TaskActivity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,actorId: null == actorId ? _self.actorId : actorId // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ActivityType,before: null == before ? _self._before : before // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,after: null == after ? _self._after : after // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

/// @nodoc
mixin _$TaskMutation {

 Task get task; TaskActivity get activity;
/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskMutationCopyWith<TaskMutation> get copyWith => _$TaskMutationCopyWithImpl<TaskMutation>(this as TaskMutation, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as TaskMutation;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskMutation&&(identical(other.task, _this.task) || other.task == _this.task)&&(identical(other.activity, _this.activity) || other.activity == _this.activity));
}


@override
int get hashCode {
  final _this = this as TaskMutation;
  return Object.hash(runtimeType,_this.task,_this.activity);
}

@override
String toString() {
  final _this = this as TaskMutation;
  return 'TaskMutation(task: ${_this.task}, activity: ${_this.activity})';
}


}

/// @nodoc
abstract mixin class $TaskMutationCopyWith<$Res>  {
  factory $TaskMutationCopyWith(TaskMutation value, $Res Function(TaskMutation) _then) = _$TaskMutationCopyWithImpl;
@useResult
$Res call({
 Task task, TaskActivity activity
});


$TaskCopyWith<$Res> get task;$TaskActivityCopyWith<$Res> get activity;

}
/// @nodoc
class _$TaskMutationCopyWithImpl<$Res>
    implements $TaskMutationCopyWith<$Res> {
  _$TaskMutationCopyWithImpl(this._self, this._then);

  final TaskMutation _self;
  final $Res Function(TaskMutation) _then;

/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = null,Object? activity = null,}) {
  return _then(TaskMutation(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as TaskActivity,
  ));
}
/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskActivityCopyWith<$Res> get activity {
  
  return $TaskActivityCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskMutation].
extension TaskMutationPatterns on TaskMutation {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskMutation value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskMutation() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskMutation value)  $default,){
final _that = this;
switch (_that) {
case _TaskMutation():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskMutation value)?  $default,){
final _that = this;
switch (_that) {
case _TaskMutation() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Task task,  TaskActivity activity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskMutation() when $default != null:
return $default(_that.task,_that.activity);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Task task,  TaskActivity activity)  $default,) {final _that = this;
switch (_that) {
case _TaskMutation():
return $default(_that.task,_that.activity);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Task task,  TaskActivity activity)?  $default,) {final _that = this;
switch (_that) {
case _TaskMutation() when $default != null:
return $default(_that.task,_that.activity);case _:
  return null;

}
}

}

/// @nodoc


class _TaskMutation implements TaskMutation {
  const _TaskMutation({required this.task, required this.activity});
  

@override final  Task task;
@override final  TaskActivity activity;

/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskMutationCopyWith<_TaskMutation> get copyWith => __$TaskMutationCopyWithImpl<_TaskMutation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskMutation&&(identical(other.task, task) || other.task == task)&&(identical(other.activity, activity) || other.activity == activity));
}


@override
int get hashCode {
    return Object.hash(runtimeType,task,activity);
}

@override
String toString() {
    return 'TaskMutation(task: $task, activity: $activity)';
}


}

/// @nodoc
abstract mixin class _$TaskMutationCopyWith<$Res> implements $TaskMutationCopyWith<$Res> {
  factory _$TaskMutationCopyWith(_TaskMutation value, $Res Function(_TaskMutation) _then) = __$TaskMutationCopyWithImpl;
@override @useResult
$Res call({
 Task task, TaskActivity activity
});


@override $TaskCopyWith<$Res> get task;@override $TaskActivityCopyWith<$Res> get activity;

}
/// @nodoc
class __$TaskMutationCopyWithImpl<$Res>
    implements _$TaskMutationCopyWith<$Res> {
  __$TaskMutationCopyWithImpl(this._self, this._then);

  final _TaskMutation _self;
  final $Res Function(_TaskMutation) _then;

/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = null,Object? activity = null,}) {
  return _then(_TaskMutation(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as Task,activity: null == activity ? _self.activity : activity // ignore: cast_nullable_to_non_nullable
as TaskActivity,
  ));
}

/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskCopyWith<$Res> get task {
  
  return $TaskCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskMutation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TaskActivityCopyWith<$Res> get activity {
  
  return $TaskActivityCopyWith<$Res>(_self.activity, (value) {
    return _then(_self.copyWith(activity: value));
  });
}
}

// dart format on
