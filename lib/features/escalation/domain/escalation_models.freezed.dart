// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escalation_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EscalationStep {

 int get level; EscalationTrigger get triggerCondition; Duration get afterDuration; List<EscalationTargetType> get notifyTargets; EscalationAction get action; int get maxRepeats; Duration? get repeatEvery; String? get specificUserId; MemberRole? get targetRole;
/// Create a copy of EscalationStep
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EscalationStepCopyWith<EscalationStep> get copyWith => _$EscalationStepCopyWithImpl<EscalationStep>(this as EscalationStep, _$identity);

  /// Serializes this EscalationStep to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EscalationStep;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EscalationStep&&(identical(other.level, _this.level) || other.level == _this.level)&&(identical(other.triggerCondition, _this.triggerCondition) || other.triggerCondition == _this.triggerCondition)&&(identical(other.afterDuration, _this.afterDuration) || other.afterDuration == _this.afterDuration)&&const DeepCollectionEquality().equals(other.notifyTargets, _this.notifyTargets)&&(identical(other.action, _this.action) || other.action == _this.action)&&(identical(other.maxRepeats, _this.maxRepeats) || other.maxRepeats == _this.maxRepeats)&&(identical(other.repeatEvery, _this.repeatEvery) || other.repeatEvery == _this.repeatEvery)&&(identical(other.specificUserId, _this.specificUserId) || other.specificUserId == _this.specificUserId)&&(identical(other.targetRole, _this.targetRole) || other.targetRole == _this.targetRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EscalationStep;
  return Object.hash(runtimeType,_this.level,_this.triggerCondition,_this.afterDuration,const DeepCollectionEquality().hash(_this.notifyTargets),_this.action,_this.maxRepeats,_this.repeatEvery,_this.specificUserId,_this.targetRole);
}

@override
String toString() {
  final _this = this as EscalationStep;
  return 'EscalationStep(level: ${_this.level}, triggerCondition: ${_this.triggerCondition}, afterDuration: ${_this.afterDuration}, notifyTargets: ${_this.notifyTargets}, action: ${_this.action}, maxRepeats: ${_this.maxRepeats}, repeatEvery: ${_this.repeatEvery}, specificUserId: ${_this.specificUserId}, targetRole: ${_this.targetRole})';
}


}

/// @nodoc
abstract mixin class $EscalationStepCopyWith<$Res>  {
  factory $EscalationStepCopyWith(EscalationStep value, $Res Function(EscalationStep) _then) = _$EscalationStepCopyWithImpl;
@useResult
$Res call({
 int level, EscalationTrigger triggerCondition, Duration afterDuration, List<EscalationTargetType> notifyTargets, EscalationAction action, int maxRepeats, Duration? repeatEvery, String? specificUserId, MemberRole? targetRole
});




}
/// @nodoc
class _$EscalationStepCopyWithImpl<$Res>
    implements $EscalationStepCopyWith<$Res> {
  _$EscalationStepCopyWithImpl(this._self, this._then);

  final EscalationStep _self;
  final $Res Function(EscalationStep) _then;

/// Create a copy of EscalationStep
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? level = null,Object? triggerCondition = null,Object? afterDuration = null,Object? notifyTargets = null,Object? action = null,Object? maxRepeats = null,Object? repeatEvery = freezed,Object? specificUserId = freezed,Object? targetRole = freezed,}) {
  return _then(EscalationStep(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,triggerCondition: null == triggerCondition ? _self.triggerCondition : triggerCondition // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,afterDuration: null == afterDuration ? _self.afterDuration : afterDuration // ignore: cast_nullable_to_non_nullable
as Duration,notifyTargets: null == notifyTargets ? _self.notifyTargets : notifyTargets // ignore: cast_nullable_to_non_nullable
as List<EscalationTargetType>,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as EscalationAction,maxRepeats: null == maxRepeats ? _self.maxRepeats : maxRepeats // ignore: cast_nullable_to_non_nullable
as int,repeatEvery: freezed == repeatEvery ? _self.repeatEvery : repeatEvery // ignore: cast_nullable_to_non_nullable
as Duration?,specificUserId: freezed == specificUserId ? _self.specificUserId : specificUserId // ignore: cast_nullable_to_non_nullable
as String?,targetRole: freezed == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as MemberRole?,
  ));
}

}


/// Adds pattern-matching-related methods to [EscalationStep].
extension EscalationStepPatterns on EscalationStep {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EscalationStep value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EscalationStep() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EscalationStep value)  $default,){
final _that = this;
switch (_that) {
case _EscalationStep():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EscalationStep value)?  $default,){
final _that = this;
switch (_that) {
case _EscalationStep() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int level,  EscalationTrigger triggerCondition,  Duration afterDuration,  List<EscalationTargetType> notifyTargets,  EscalationAction action,  int maxRepeats,  Duration? repeatEvery,  String? specificUserId,  MemberRole? targetRole)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EscalationStep() when $default != null:
return $default(_that.level,_that.triggerCondition,_that.afterDuration,_that.notifyTargets,_that.action,_that.maxRepeats,_that.repeatEvery,_that.specificUserId,_that.targetRole);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int level,  EscalationTrigger triggerCondition,  Duration afterDuration,  List<EscalationTargetType> notifyTargets,  EscalationAction action,  int maxRepeats,  Duration? repeatEvery,  String? specificUserId,  MemberRole? targetRole)  $default,) {final _that = this;
switch (_that) {
case _EscalationStep():
return $default(_that.level,_that.triggerCondition,_that.afterDuration,_that.notifyTargets,_that.action,_that.maxRepeats,_that.repeatEvery,_that.specificUserId,_that.targetRole);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int level,  EscalationTrigger triggerCondition,  Duration afterDuration,  List<EscalationTargetType> notifyTargets,  EscalationAction action,  int maxRepeats,  Duration? repeatEvery,  String? specificUserId,  MemberRole? targetRole)?  $default,) {final _that = this;
switch (_that) {
case _EscalationStep() when $default != null:
return $default(_that.level,_that.triggerCondition,_that.afterDuration,_that.notifyTargets,_that.action,_that.maxRepeats,_that.repeatEvery,_that.specificUserId,_that.targetRole);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EscalationStep implements EscalationStep {
  const _EscalationStep({required this.level, required this.triggerCondition, required this.afterDuration, required  List<EscalationTargetType> notifyTargets, required this.action, required this.maxRepeats, this.repeatEvery, this.specificUserId, this.targetRole}): _notifyTargets = notifyTargets;
  factory _EscalationStep.fromJson(Map<String, dynamic> json) => _$EscalationStepFromJson(json);

@override final  int level;
@override final  EscalationTrigger triggerCondition;
@override final  Duration afterDuration;
 final  List<EscalationTargetType> _notifyTargets;
@override List<EscalationTargetType> get notifyTargets {
  if (_notifyTargets is EqualUnmodifiableListView) return _notifyTargets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifyTargets);
}

@override final  EscalationAction action;
@override final  int maxRepeats;
@override final  Duration? repeatEvery;
@override final  String? specificUserId;
@override final  MemberRole? targetRole;

/// Create a copy of EscalationStep
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EscalationStepCopyWith<_EscalationStep> get copyWith => __$EscalationStepCopyWithImpl<_EscalationStep>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EscalationStepToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EscalationStep&&(identical(other.level, level) || other.level == level)&&(identical(other.triggerCondition, triggerCondition) || other.triggerCondition == triggerCondition)&&(identical(other.afterDuration, afterDuration) || other.afterDuration == afterDuration)&&const DeepCollectionEquality().equals(other.notifyTargets, _notifyTargets)&&(identical(other.action, action) || other.action == action)&&(identical(other.maxRepeats, maxRepeats) || other.maxRepeats == maxRepeats)&&(identical(other.repeatEvery, repeatEvery) || other.repeatEvery == repeatEvery)&&(identical(other.specificUserId, specificUserId) || other.specificUserId == specificUserId)&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,level,triggerCondition,afterDuration,const DeepCollectionEquality().hash(_notifyTargets),action,maxRepeats,repeatEvery,specificUserId,targetRole);
}

@override
String toString() {
    return 'EscalationStep(level: $level, triggerCondition: $triggerCondition, afterDuration: $afterDuration, notifyTargets: $notifyTargets, action: $action, maxRepeats: $maxRepeats, repeatEvery: $repeatEvery, specificUserId: $specificUserId, targetRole: $targetRole)';
}


}

/// @nodoc
abstract mixin class _$EscalationStepCopyWith<$Res> implements $EscalationStepCopyWith<$Res> {
  factory _$EscalationStepCopyWith(_EscalationStep value, $Res Function(_EscalationStep) _then) = __$EscalationStepCopyWithImpl;
@override @useResult
$Res call({
 int level, EscalationTrigger triggerCondition, Duration afterDuration, List<EscalationTargetType> notifyTargets, EscalationAction action, int maxRepeats, Duration? repeatEvery, String? specificUserId, MemberRole? targetRole
});




}
/// @nodoc
class __$EscalationStepCopyWithImpl<$Res>
    implements _$EscalationStepCopyWith<$Res> {
  __$EscalationStepCopyWithImpl(this._self, this._then);

  final _EscalationStep _self;
  final $Res Function(_EscalationStep) _then;

/// Create a copy of EscalationStep
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? level = null,Object? triggerCondition = null,Object? afterDuration = null,Object? notifyTargets = null,Object? action = null,Object? maxRepeats = null,Object? repeatEvery = freezed,Object? specificUserId = freezed,Object? targetRole = freezed,}) {
  return _then(_EscalationStep(
level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as int,triggerCondition: null == triggerCondition ? _self.triggerCondition : triggerCondition // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,afterDuration: null == afterDuration ? _self.afterDuration : afterDuration // ignore: cast_nullable_to_non_nullable
as Duration,notifyTargets: null == notifyTargets ? _self._notifyTargets : notifyTargets // ignore: cast_nullable_to_non_nullable
as List<EscalationTargetType>,action: null == action ? _self.action : action // ignore: cast_nullable_to_non_nullable
as EscalationAction,maxRepeats: null == maxRepeats ? _self.maxRepeats : maxRepeats // ignore: cast_nullable_to_non_nullable
as int,repeatEvery: freezed == repeatEvery ? _self.repeatEvery : repeatEvery // ignore: cast_nullable_to_non_nullable
as Duration?,specificUserId: freezed == specificUserId ? _self.specificUserId : specificUserId // ignore: cast_nullable_to_non_nullable
as String?,targetRole: freezed == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as MemberRole?,
  ));
}


}


/// @nodoc
mixin _$EscalationPolicy {

 String get id; String get orgId; String get name; List<EscalationStep> get steps; Set<Priority> get priorities; Set<String> get teamIds; bool get isDefault; bool get active;
/// Create a copy of EscalationPolicy
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EscalationPolicyCopyWith<EscalationPolicy> get copyWith => _$EscalationPolicyCopyWithImpl<EscalationPolicy>(this as EscalationPolicy, _$identity);

  /// Serializes this EscalationPolicy to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EscalationPolicy;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EscalationPolicy&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.orgId, _this.orgId) || other.orgId == _this.orgId)&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.steps, _this.steps)&&const DeepCollectionEquality().equals(other.priorities, _this.priorities)&&const DeepCollectionEquality().equals(other.teamIds, _this.teamIds)&&(identical(other.isDefault, _this.isDefault) || other.isDefault == _this.isDefault)&&(identical(other.active, _this.active) || other.active == _this.active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EscalationPolicy;
  return Object.hash(runtimeType,_this.id,_this.orgId,_this.name,const DeepCollectionEquality().hash(_this.steps),const DeepCollectionEquality().hash(_this.priorities),const DeepCollectionEquality().hash(_this.teamIds),_this.isDefault,_this.active);
}

@override
String toString() {
  final _this = this as EscalationPolicy;
  return 'EscalationPolicy(id: ${_this.id}, orgId: ${_this.orgId}, name: ${_this.name}, steps: ${_this.steps}, priorities: ${_this.priorities}, teamIds: ${_this.teamIds}, isDefault: ${_this.isDefault}, active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $EscalationPolicyCopyWith<$Res>  {
  factory $EscalationPolicyCopyWith(EscalationPolicy value, $Res Function(EscalationPolicy) _then) = _$EscalationPolicyCopyWithImpl;
@useResult
$Res call({
 String id, String orgId, String name, List<EscalationStep> steps, Set<Priority> priorities, Set<String> teamIds, bool isDefault, bool active
});




}
/// @nodoc
class _$EscalationPolicyCopyWithImpl<$Res>
    implements $EscalationPolicyCopyWith<$Res> {
  _$EscalationPolicyCopyWithImpl(this._self, this._then);

  final EscalationPolicy _self;
  final $Res Function(EscalationPolicy) _then;

/// Create a copy of EscalationPolicy
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? steps = null,Object? priorities = null,Object? teamIds = null,Object? isDefault = null,Object? active = null,}) {
  return _then(EscalationPolicy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self.steps : steps // ignore: cast_nullable_to_non_nullable
as List<EscalationStep>,priorities: null == priorities ? _self.priorities : priorities // ignore: cast_nullable_to_non_nullable
as Set<Priority>,teamIds: null == teamIds ? _self.teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [EscalationPolicy].
extension EscalationPolicyPatterns on EscalationPolicy {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EscalationPolicy value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EscalationPolicy() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EscalationPolicy value)  $default,){
final _that = this;
switch (_that) {
case _EscalationPolicy():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EscalationPolicy value)?  $default,){
final _that = this;
switch (_that) {
case _EscalationPolicy() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String orgId,  String name,  List<EscalationStep> steps,  Set<Priority> priorities,  Set<String> teamIds,  bool isDefault,  bool active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EscalationPolicy() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.steps,_that.priorities,_that.teamIds,_that.isDefault,_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String orgId,  String name,  List<EscalationStep> steps,  Set<Priority> priorities,  Set<String> teamIds,  bool isDefault,  bool active)  $default,) {final _that = this;
switch (_that) {
case _EscalationPolicy():
return $default(_that.id,_that.orgId,_that.name,_that.steps,_that.priorities,_that.teamIds,_that.isDefault,_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String orgId,  String name,  List<EscalationStep> steps,  Set<Priority> priorities,  Set<String> teamIds,  bool isDefault,  bool active)?  $default,) {final _that = this;
switch (_that) {
case _EscalationPolicy() when $default != null:
return $default(_that.id,_that.orgId,_that.name,_that.steps,_that.priorities,_that.teamIds,_that.isDefault,_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EscalationPolicy implements EscalationPolicy {
  const _EscalationPolicy({required this.id, required this.orgId, required this.name, required  List<EscalationStep> steps, required  Set<Priority> priorities, required  Set<String> teamIds, required this.isDefault, required this.active}): _steps = steps,_priorities = priorities,_teamIds = teamIds;
  factory _EscalationPolicy.fromJson(Map<String, dynamic> json) => _$EscalationPolicyFromJson(json);

@override final  String id;
@override final  String orgId;
@override final  String name;
 final  List<EscalationStep> _steps;
@override List<EscalationStep> get steps {
  if (_steps is EqualUnmodifiableListView) return _steps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_steps);
}

 final  Set<Priority> _priorities;
@override Set<Priority> get priorities {
  if (_priorities is EqualUnmodifiableSetView) return _priorities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_priorities);
}

 final  Set<String> _teamIds;
@override Set<String> get teamIds {
  if (_teamIds is EqualUnmodifiableSetView) return _teamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_teamIds);
}

@override final  bool isDefault;
@override final  bool active;

/// Create a copy of EscalationPolicy
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EscalationPolicyCopyWith<_EscalationPolicy> get copyWith => __$EscalationPolicyCopyWithImpl<_EscalationPolicy>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EscalationPolicyToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EscalationPolicy&&(identical(other.id, id) || other.id == id)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.steps, _steps)&&const DeepCollectionEquality().equals(other.priorities, _priorities)&&const DeepCollectionEquality().equals(other.teamIds, _teamIds)&&(identical(other.isDefault, isDefault) || other.isDefault == isDefault)&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,orgId,name,const DeepCollectionEquality().hash(_steps),const DeepCollectionEquality().hash(_priorities),const DeepCollectionEquality().hash(_teamIds),isDefault,active);
}

@override
String toString() {
    return 'EscalationPolicy(id: $id, orgId: $orgId, name: $name, steps: $steps, priorities: $priorities, teamIds: $teamIds, isDefault: $isDefault, active: $active)';
}


}

/// @nodoc
abstract mixin class _$EscalationPolicyCopyWith<$Res> implements $EscalationPolicyCopyWith<$Res> {
  factory _$EscalationPolicyCopyWith(_EscalationPolicy value, $Res Function(_EscalationPolicy) _then) = __$EscalationPolicyCopyWithImpl;
@override @useResult
$Res call({
 String id, String orgId, String name, List<EscalationStep> steps, Set<Priority> priorities, Set<String> teamIds, bool isDefault, bool active
});




}
/// @nodoc
class __$EscalationPolicyCopyWithImpl<$Res>
    implements _$EscalationPolicyCopyWith<$Res> {
  __$EscalationPolicyCopyWithImpl(this._self, this._then);

  final _EscalationPolicy _self;
  final $Res Function(_EscalationPolicy) _then;

/// Create a copy of EscalationPolicy
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orgId = null,Object? name = null,Object? steps = null,Object? priorities = null,Object? teamIds = null,Object? isDefault = null,Object? active = null,}) {
  return _then(_EscalationPolicy(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,steps: null == steps ? _self._steps : steps // ignore: cast_nullable_to_non_nullable
as List<EscalationStep>,priorities: null == priorities ? _self._priorities : priorities // ignore: cast_nullable_to_non_nullable
as Set<Priority>,teamIds: null == teamIds ? _self._teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as Set<String>,isDefault: null == isDefault ? _self.isDefault : isDefault // ignore: cast_nullable_to_non_nullable
as bool,active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$EscalationEvent {

 String get id; String get taskId; int get fromLevel; int get toLevel; EscalationTrigger get reason; String get triggeredBy; List<String> get notifiedUserIds; DateTime get createdAt; int get repeat;
/// Create a copy of EscalationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EscalationEventCopyWith<EscalationEvent> get copyWith => _$EscalationEventCopyWithImpl<EscalationEvent>(this as EscalationEvent, _$identity);

  /// Serializes this EscalationEvent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EscalationEvent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EscalationEvent&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.fromLevel, _this.fromLevel) || other.fromLevel == _this.fromLevel)&&(identical(other.toLevel, _this.toLevel) || other.toLevel == _this.toLevel)&&(identical(other.reason, _this.reason) || other.reason == _this.reason)&&(identical(other.triggeredBy, _this.triggeredBy) || other.triggeredBy == _this.triggeredBy)&&const DeepCollectionEquality().equals(other.notifiedUserIds, _this.notifiedUserIds)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.repeat, _this.repeat) || other.repeat == _this.repeat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EscalationEvent;
  return Object.hash(runtimeType,_this.id,_this.taskId,_this.fromLevel,_this.toLevel,_this.reason,_this.triggeredBy,const DeepCollectionEquality().hash(_this.notifiedUserIds),_this.createdAt,_this.repeat);
}

@override
String toString() {
  final _this = this as EscalationEvent;
  return 'EscalationEvent(id: ${_this.id}, taskId: ${_this.taskId}, fromLevel: ${_this.fromLevel}, toLevel: ${_this.toLevel}, reason: ${_this.reason}, triggeredBy: ${_this.triggeredBy}, notifiedUserIds: ${_this.notifiedUserIds}, createdAt: ${_this.createdAt}, repeat: ${_this.repeat})';
}


}

/// @nodoc
abstract mixin class $EscalationEventCopyWith<$Res>  {
  factory $EscalationEventCopyWith(EscalationEvent value, $Res Function(EscalationEvent) _then) = _$EscalationEventCopyWithImpl;
@useResult
$Res call({
 String id, String taskId, int fromLevel, int toLevel, EscalationTrigger reason, String triggeredBy, List<String> notifiedUserIds, DateTime createdAt, int repeat
});




}
/// @nodoc
class _$EscalationEventCopyWithImpl<$Res>
    implements $EscalationEventCopyWith<$Res> {
  _$EscalationEventCopyWithImpl(this._self, this._then);

  final EscalationEvent _self;
  final $Res Function(EscalationEvent) _then;

/// Create a copy of EscalationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? taskId = null,Object? fromLevel = null,Object? toLevel = null,Object? reason = null,Object? triggeredBy = null,Object? notifiedUserIds = null,Object? createdAt = null,Object? repeat = null,}) {
  return _then(EscalationEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,fromLevel: null == fromLevel ? _self.fromLevel : fromLevel // ignore: cast_nullable_to_non_nullable
as int,toLevel: null == toLevel ? _self.toLevel : toLevel // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,triggeredBy: null == triggeredBy ? _self.triggeredBy : triggeredBy // ignore: cast_nullable_to_non_nullable
as String,notifiedUserIds: null == notifiedUserIds ? _self.notifiedUserIds : notifiedUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [EscalationEvent].
extension EscalationEventPatterns on EscalationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EscalationEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EscalationEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EscalationEvent value)  $default,){
final _that = this;
switch (_that) {
case _EscalationEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EscalationEvent value)?  $default,){
final _that = this;
switch (_that) {
case _EscalationEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String taskId,  int fromLevel,  int toLevel,  EscalationTrigger reason,  String triggeredBy,  List<String> notifiedUserIds,  DateTime createdAt,  int repeat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EscalationEvent() when $default != null:
return $default(_that.id,_that.taskId,_that.fromLevel,_that.toLevel,_that.reason,_that.triggeredBy,_that.notifiedUserIds,_that.createdAt,_that.repeat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String taskId,  int fromLevel,  int toLevel,  EscalationTrigger reason,  String triggeredBy,  List<String> notifiedUserIds,  DateTime createdAt,  int repeat)  $default,) {final _that = this;
switch (_that) {
case _EscalationEvent():
return $default(_that.id,_that.taskId,_that.fromLevel,_that.toLevel,_that.reason,_that.triggeredBy,_that.notifiedUserIds,_that.createdAt,_that.repeat);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String taskId,  int fromLevel,  int toLevel,  EscalationTrigger reason,  String triggeredBy,  List<String> notifiedUserIds,  DateTime createdAt,  int repeat)?  $default,) {final _that = this;
switch (_that) {
case _EscalationEvent() when $default != null:
return $default(_that.id,_that.taskId,_that.fromLevel,_that.toLevel,_that.reason,_that.triggeredBy,_that.notifiedUserIds,_that.createdAt,_that.repeat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EscalationEvent implements EscalationEvent {
  const _EscalationEvent({required this.id, required this.taskId, required this.fromLevel, required this.toLevel, required this.reason, required this.triggeredBy, required  List<String> notifiedUserIds, required this.createdAt, this.repeat = 0}): _notifiedUserIds = notifiedUserIds;
  factory _EscalationEvent.fromJson(Map<String, dynamic> json) => _$EscalationEventFromJson(json);

@override final  String id;
@override final  String taskId;
@override final  int fromLevel;
@override final  int toLevel;
@override final  EscalationTrigger reason;
@override final  String triggeredBy;
 final  List<String> _notifiedUserIds;
@override List<String> get notifiedUserIds {
  if (_notifiedUserIds is EqualUnmodifiableListView) return _notifiedUserIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_notifiedUserIds);
}

@override final  DateTime createdAt;
@override@JsonKey() final  int repeat;

/// Create a copy of EscalationEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EscalationEventCopyWith<_EscalationEvent> get copyWith => __$EscalationEventCopyWithImpl<_EscalationEvent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EscalationEventToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EscalationEvent&&(identical(other.id, id) || other.id == id)&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.fromLevel, fromLevel) || other.fromLevel == fromLevel)&&(identical(other.toLevel, toLevel) || other.toLevel == toLevel)&&(identical(other.reason, reason) || other.reason == reason)&&(identical(other.triggeredBy, triggeredBy) || other.triggeredBy == triggeredBy)&&const DeepCollectionEquality().equals(other.notifiedUserIds, _notifiedUserIds)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.repeat, repeat) || other.repeat == repeat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,taskId,fromLevel,toLevel,reason,triggeredBy,const DeepCollectionEquality().hash(_notifiedUserIds),createdAt,repeat);
}

@override
String toString() {
    return 'EscalationEvent(id: $id, taskId: $taskId, fromLevel: $fromLevel, toLevel: $toLevel, reason: $reason, triggeredBy: $triggeredBy, notifiedUserIds: $notifiedUserIds, createdAt: $createdAt, repeat: $repeat)';
}


}

/// @nodoc
abstract mixin class _$EscalationEventCopyWith<$Res> implements $EscalationEventCopyWith<$Res> {
  factory _$EscalationEventCopyWith(_EscalationEvent value, $Res Function(_EscalationEvent) _then) = __$EscalationEventCopyWithImpl;
@override @useResult
$Res call({
 String id, String taskId, int fromLevel, int toLevel, EscalationTrigger reason, String triggeredBy, List<String> notifiedUserIds, DateTime createdAt, int repeat
});




}
/// @nodoc
class __$EscalationEventCopyWithImpl<$Res>
    implements _$EscalationEventCopyWith<$Res> {
  __$EscalationEventCopyWithImpl(this._self, this._then);

  final _EscalationEvent _self;
  final $Res Function(_EscalationEvent) _then;

/// Create a copy of EscalationEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? taskId = null,Object? fromLevel = null,Object? toLevel = null,Object? reason = null,Object? triggeredBy = null,Object? notifiedUserIds = null,Object? createdAt = null,Object? repeat = null,}) {
  return _then(_EscalationEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,fromLevel: null == fromLevel ? _self.fromLevel : fromLevel // ignore: cast_nullable_to_non_nullable
as int,toLevel: null == toLevel ? _self.toLevel : toLevel // ignore: cast_nullable_to_non_nullable
as int,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,triggeredBy: null == triggeredBy ? _self.triggeredBy : triggeredBy // ignore: cast_nullable_to_non_nullable
as String,notifiedUserIds: null == notifiedUserIds ? _self._notifiedUserIds : notifiedUserIds // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
