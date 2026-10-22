// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'organization_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WorkingHours {

 Map<int, List<WorkingInterval>> get intervalsByWeekday;
/// Create a copy of WorkingHours
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingHoursCopyWith<WorkingHours> get copyWith => _$WorkingHoursCopyWithImpl<WorkingHours>(this as WorkingHours, _$identity);

  /// Serializes this WorkingHours to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WorkingHours;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingHours&&const DeepCollectionEquality().equals(other.intervalsByWeekday, _this.intervalsByWeekday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WorkingHours;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.intervalsByWeekday));
}

@override
String toString() {
  final _this = this as WorkingHours;
  return 'WorkingHours(intervalsByWeekday: ${_this.intervalsByWeekday})';
}


}

/// @nodoc
abstract mixin class $WorkingHoursCopyWith<$Res>  {
  factory $WorkingHoursCopyWith(WorkingHours value, $Res Function(WorkingHours) _then) = _$WorkingHoursCopyWithImpl;
@useResult
$Res call({
 Map<int, List<WorkingInterval>> intervalsByWeekday
});




}
/// @nodoc
class _$WorkingHoursCopyWithImpl<$Res>
    implements $WorkingHoursCopyWith<$Res> {
  _$WorkingHoursCopyWithImpl(this._self, this._then);

  final WorkingHours _self;
  final $Res Function(WorkingHours) _then;

/// Create a copy of WorkingHours
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? intervalsByWeekday = null,}) {
  return _then(WorkingHours(
intervalsByWeekday: null == intervalsByWeekday ? _self.intervalsByWeekday : intervalsByWeekday // ignore: cast_nullable_to_non_nullable
as Map<int, List<WorkingInterval>>,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingHours].
extension WorkingHoursPatterns on WorkingHours {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingHours value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingHours() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingHours value)  $default,){
final _that = this;
switch (_that) {
case _WorkingHours():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingHours value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingHours() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<int, List<WorkingInterval>> intervalsByWeekday)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingHours() when $default != null:
return $default(_that.intervalsByWeekday);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<int, List<WorkingInterval>> intervalsByWeekday)  $default,) {final _that = this;
switch (_that) {
case _WorkingHours():
return $default(_that.intervalsByWeekday);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<int, List<WorkingInterval>> intervalsByWeekday)?  $default,) {final _that = this;
switch (_that) {
case _WorkingHours() when $default != null:
return $default(_that.intervalsByWeekday);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkingHours implements WorkingHours {
  const _WorkingHours({required  Map<int, List<WorkingInterval>> intervalsByWeekday}): _intervalsByWeekday = intervalsByWeekday;
  factory _WorkingHours.fromJson(Map<String, dynamic> json) => _$WorkingHoursFromJson(json);

 final  Map<int, List<WorkingInterval>> _intervalsByWeekday;
@override Map<int, List<WorkingInterval>> get intervalsByWeekday {
  if (_intervalsByWeekday is EqualUnmodifiableMapView) return _intervalsByWeekday;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_intervalsByWeekday);
}


/// Create a copy of WorkingHours
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingHoursCopyWith<_WorkingHours> get copyWith => __$WorkingHoursCopyWithImpl<_WorkingHours>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkingHoursToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingHours&&const DeepCollectionEquality().equals(other.intervalsByWeekday, _intervalsByWeekday));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_intervalsByWeekday));
}

@override
String toString() {
    return 'WorkingHours(intervalsByWeekday: $intervalsByWeekday)';
}


}

/// @nodoc
abstract mixin class _$WorkingHoursCopyWith<$Res> implements $WorkingHoursCopyWith<$Res> {
  factory _$WorkingHoursCopyWith(_WorkingHours value, $Res Function(_WorkingHours) _then) = __$WorkingHoursCopyWithImpl;
@override @useResult
$Res call({
 Map<int, List<WorkingInterval>> intervalsByWeekday
});




}
/// @nodoc
class __$WorkingHoursCopyWithImpl<$Res>
    implements _$WorkingHoursCopyWith<$Res> {
  __$WorkingHoursCopyWithImpl(this._self, this._then);

  final _WorkingHours _self;
  final $Res Function(_WorkingHours) _then;

/// Create a copy of WorkingHours
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? intervalsByWeekday = null,}) {
  return _then(_WorkingHours(
intervalsByWeekday: null == intervalsByWeekday ? _self._intervalsByWeekday : intervalsByWeekday // ignore: cast_nullable_to_non_nullable
as Map<int, List<WorkingInterval>>,
  ));
}


}


/// @nodoc
mixin _$WorkingInterval {

 int get startMinute; int get endMinute;
/// Create a copy of WorkingInterval
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WorkingIntervalCopyWith<WorkingInterval> get copyWith => _$WorkingIntervalCopyWithImpl<WorkingInterval>(this as WorkingInterval, _$identity);

  /// Serializes this WorkingInterval to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as WorkingInterval;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WorkingInterval&&(identical(other.startMinute, _this.startMinute) || other.startMinute == _this.startMinute)&&(identical(other.endMinute, _this.endMinute) || other.endMinute == _this.endMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as WorkingInterval;
  return Object.hash(runtimeType,_this.startMinute,_this.endMinute);
}

@override
String toString() {
  final _this = this as WorkingInterval;
  return 'WorkingInterval(startMinute: ${_this.startMinute}, endMinute: ${_this.endMinute})';
}


}

/// @nodoc
abstract mixin class $WorkingIntervalCopyWith<$Res>  {
  factory $WorkingIntervalCopyWith(WorkingInterval value, $Res Function(WorkingInterval) _then) = _$WorkingIntervalCopyWithImpl;
@useResult
$Res call({
 int startMinute, int endMinute
});




}
/// @nodoc
class _$WorkingIntervalCopyWithImpl<$Res>
    implements $WorkingIntervalCopyWith<$Res> {
  _$WorkingIntervalCopyWithImpl(this._self, this._then);

  final WorkingInterval _self;
  final $Res Function(WorkingInterval) _then;

/// Create a copy of WorkingInterval
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? startMinute = null,Object? endMinute = null,}) {
  return _then(WorkingInterval(
startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,endMinute: null == endMinute ? _self.endMinute : endMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [WorkingInterval].
extension WorkingIntervalPatterns on WorkingInterval {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WorkingInterval value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WorkingInterval() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WorkingInterval value)  $default,){
final _that = this;
switch (_that) {
case _WorkingInterval():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WorkingInterval value)?  $default,){
final _that = this;
switch (_that) {
case _WorkingInterval() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int startMinute,  int endMinute)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WorkingInterval() when $default != null:
return $default(_that.startMinute,_that.endMinute);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int startMinute,  int endMinute)  $default,) {final _that = this;
switch (_that) {
case _WorkingInterval():
return $default(_that.startMinute,_that.endMinute);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int startMinute,  int endMinute)?  $default,) {final _that = this;
switch (_that) {
case _WorkingInterval() when $default != null:
return $default(_that.startMinute,_that.endMinute);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _WorkingInterval implements WorkingInterval {
  const _WorkingInterval({required this.startMinute, required this.endMinute});
  factory _WorkingInterval.fromJson(Map<String, dynamic> json) => _$WorkingIntervalFromJson(json);

@override final  int startMinute;
@override final  int endMinute;

/// Create a copy of WorkingInterval
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WorkingIntervalCopyWith<_WorkingInterval> get copyWith => __$WorkingIntervalCopyWithImpl<_WorkingInterval>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WorkingIntervalToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _WorkingInterval&&(identical(other.startMinute, startMinute) || other.startMinute == startMinute)&&(identical(other.endMinute, endMinute) || other.endMinute == endMinute));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,startMinute,endMinute);
}

@override
String toString() {
    return 'WorkingInterval(startMinute: $startMinute, endMinute: $endMinute)';
}


}

/// @nodoc
abstract mixin class _$WorkingIntervalCopyWith<$Res> implements $WorkingIntervalCopyWith<$Res> {
  factory _$WorkingIntervalCopyWith(_WorkingInterval value, $Res Function(_WorkingInterval) _then) = __$WorkingIntervalCopyWithImpl;
@override @useResult
$Res call({
 int startMinute, int endMinute
});




}
/// @nodoc
class __$WorkingIntervalCopyWithImpl<$Res>
    implements _$WorkingIntervalCopyWith<$Res> {
  __$WorkingIntervalCopyWithImpl(this._self, this._then);

  final _WorkingInterval _self;
  final $Res Function(_WorkingInterval) _then;

/// Create a copy of WorkingInterval
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? startMinute = null,Object? endMinute = null,}) {
  return _then(_WorkingInterval(
startMinute: null == startMinute ? _self.startMinute : startMinute // ignore: cast_nullable_to_non_nullable
as int,endMinute: null == endMinute ? _self.endMinute : endMinute // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$Membership {

 String get userId; String get orgId; List<String> get teamIds; MemberRole get role; MembershipStatus get status; String? get managerId; String? get delegateUserId;
/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MembershipCopyWith<Membership> get copyWith => _$MembershipCopyWithImpl<Membership>(this as Membership, _$identity);

  /// Serializes this Membership to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Membership;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Membership&&(identical(other.userId, _this.userId) || other.userId == _this.userId)&&(identical(other.orgId, _this.orgId) || other.orgId == _this.orgId)&&const DeepCollectionEquality().equals(other.teamIds, _this.teamIds)&&(identical(other.role, _this.role) || other.role == _this.role)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.delegateUserId, _this.delegateUserId) || other.delegateUserId == _this.delegateUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Membership;
  return Object.hash(runtimeType,_this.userId,_this.orgId,const DeepCollectionEquality().hash(_this.teamIds),_this.role,_this.status,_this.managerId,_this.delegateUserId);
}

@override
String toString() {
  final _this = this as Membership;
  return 'Membership(userId: ${_this.userId}, orgId: ${_this.orgId}, teamIds: ${_this.teamIds}, role: ${_this.role}, status: ${_this.status}, managerId: ${_this.managerId}, delegateUserId: ${_this.delegateUserId})';
}


}

/// @nodoc
abstract mixin class $MembershipCopyWith<$Res>  {
  factory $MembershipCopyWith(Membership value, $Res Function(Membership) _then) = _$MembershipCopyWithImpl;
@useResult
$Res call({
 String userId, String orgId, List<String> teamIds, MemberRole role, MembershipStatus status, String? managerId, String? delegateUserId
});




}
/// @nodoc
class _$MembershipCopyWithImpl<$Res>
    implements $MembershipCopyWith<$Res> {
  _$MembershipCopyWithImpl(this._self, this._then);

  final Membership _self;
  final $Res Function(Membership) _then;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? orgId = null,Object? teamIds = null,Object? role = null,Object? status = null,Object? managerId = freezed,Object? delegateUserId = freezed,}) {
  return _then(Membership(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,teamIds: null == teamIds ? _self.teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as List<String>,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MembershipStatus,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,delegateUserId: freezed == delegateUserId ? _self.delegateUserId : delegateUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Membership].
extension MembershipPatterns on Membership {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Membership value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Membership() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Membership value)  $default,){
final _that = this;
switch (_that) {
case _Membership():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Membership value)?  $default,){
final _that = this;
switch (_that) {
case _Membership() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String userId,  String orgId,  List<String> teamIds,  MemberRole role,  MembershipStatus status,  String? managerId,  String? delegateUserId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Membership() when $default != null:
return $default(_that.userId,_that.orgId,_that.teamIds,_that.role,_that.status,_that.managerId,_that.delegateUserId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String userId,  String orgId,  List<String> teamIds,  MemberRole role,  MembershipStatus status,  String? managerId,  String? delegateUserId)  $default,) {final _that = this;
switch (_that) {
case _Membership():
return $default(_that.userId,_that.orgId,_that.teamIds,_that.role,_that.status,_that.managerId,_that.delegateUserId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String userId,  String orgId,  List<String> teamIds,  MemberRole role,  MembershipStatus status,  String? managerId,  String? delegateUserId)?  $default,) {final _that = this;
switch (_that) {
case _Membership() when $default != null:
return $default(_that.userId,_that.orgId,_that.teamIds,_that.role,_that.status,_that.managerId,_that.delegateUserId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Membership implements Membership {
  const _Membership({required this.userId, required this.orgId, required  List<String> teamIds, required this.role, required this.status, this.managerId, this.delegateUserId}): _teamIds = teamIds;
  factory _Membership.fromJson(Map<String, dynamic> json) => _$MembershipFromJson(json);

@override final  String userId;
@override final  String orgId;
 final  List<String> _teamIds;
@override List<String> get teamIds {
  if (_teamIds is EqualUnmodifiableListView) return _teamIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teamIds);
}

@override final  MemberRole role;
@override final  MembershipStatus status;
@override final  String? managerId;
@override final  String? delegateUserId;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MembershipCopyWith<_Membership> get copyWith => __$MembershipCopyWithImpl<_Membership>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MembershipToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Membership&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.orgId, orgId) || other.orgId == orgId)&&const DeepCollectionEquality().equals(other.teamIds, _teamIds)&&(identical(other.role, role) || other.role == role)&&(identical(other.status, status) || other.status == status)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.delegateUserId, delegateUserId) || other.delegateUserId == delegateUserId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,userId,orgId,const DeepCollectionEquality().hash(_teamIds),role,status,managerId,delegateUserId);
}

@override
String toString() {
    return 'Membership(userId: $userId, orgId: $orgId, teamIds: $teamIds, role: $role, status: $status, managerId: $managerId, delegateUserId: $delegateUserId)';
}


}

/// @nodoc
abstract mixin class _$MembershipCopyWith<$Res> implements $MembershipCopyWith<$Res> {
  factory _$MembershipCopyWith(_Membership value, $Res Function(_Membership) _then) = __$MembershipCopyWithImpl;
@override @useResult
$Res call({
 String userId, String orgId, List<String> teamIds, MemberRole role, MembershipStatus status, String? managerId, String? delegateUserId
});




}
/// @nodoc
class __$MembershipCopyWithImpl<$Res>
    implements _$MembershipCopyWith<$Res> {
  __$MembershipCopyWithImpl(this._self, this._then);

  final _Membership _self;
  final $Res Function(_Membership) _then;

/// Create a copy of Membership
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? orgId = null,Object? teamIds = null,Object? role = null,Object? status = null,Object? managerId = freezed,Object? delegateUserId = freezed,}) {
  return _then(_Membership(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,orgId: null == orgId ? _self.orgId : orgId // ignore: cast_nullable_to_non_nullable
as String,teamIds: null == teamIds ? _self._teamIds : teamIds // ignore: cast_nullable_to_non_nullable
as List<String>,role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as MemberRole,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as MembershipStatus,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as String?,delegateUserId: freezed == delegateUserId ? _self.delegateUserId : delegateUserId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$Organization {

 String get id; String get name; String get ownerId; String get defaultEscalationPolicyId; Map<String, Object?> get settings;
/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrganizationCopyWith<Organization> get copyWith => _$OrganizationCopyWithImpl<Organization>(this as Organization, _$identity);

  /// Serializes this Organization to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Organization;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Organization&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.ownerId, _this.ownerId) || other.ownerId == _this.ownerId)&&(identical(other.defaultEscalationPolicyId, _this.defaultEscalationPolicyId) || other.defaultEscalationPolicyId == _this.defaultEscalationPolicyId)&&const DeepCollectionEquality().equals(other.settings, _this.settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Organization;
  return Object.hash(runtimeType,_this.id,_this.name,_this.ownerId,_this.defaultEscalationPolicyId,const DeepCollectionEquality().hash(_this.settings));
}

@override
String toString() {
  final _this = this as Organization;
  return 'Organization(id: ${_this.id}, name: ${_this.name}, ownerId: ${_this.ownerId}, defaultEscalationPolicyId: ${_this.defaultEscalationPolicyId}, settings: ${_this.settings})';
}


}

/// @nodoc
abstract mixin class $OrganizationCopyWith<$Res>  {
  factory $OrganizationCopyWith(Organization value, $Res Function(Organization) _then) = _$OrganizationCopyWithImpl;
@useResult
$Res call({
 String id, String name, String ownerId, String defaultEscalationPolicyId, Map<String, Object?> settings
});




}
/// @nodoc
class _$OrganizationCopyWithImpl<$Res>
    implements $OrganizationCopyWith<$Res> {
  _$OrganizationCopyWithImpl(this._self, this._then);

  final Organization _self;
  final $Res Function(Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? ownerId = null,Object? defaultEscalationPolicyId = null,Object? settings = null,}) {
  return _then(Organization(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,defaultEscalationPolicyId: null == defaultEscalationPolicyId ? _self.defaultEscalationPolicyId : defaultEscalationPolicyId // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}

}


/// Adds pattern-matching-related methods to [Organization].
extension OrganizationPatterns on Organization {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Organization value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Organization() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Organization value)  $default,){
final _that = this;
switch (_that) {
case _Organization():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Organization value)?  $default,){
final _that = this;
switch (_that) {
case _Organization() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String ownerId,  String defaultEscalationPolicyId,  Map<String, Object?> settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.id,_that.name,_that.ownerId,_that.defaultEscalationPolicyId,_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String ownerId,  String defaultEscalationPolicyId,  Map<String, Object?> settings)  $default,) {final _that = this;
switch (_that) {
case _Organization():
return $default(_that.id,_that.name,_that.ownerId,_that.defaultEscalationPolicyId,_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String ownerId,  String defaultEscalationPolicyId,  Map<String, Object?> settings)?  $default,) {final _that = this;
switch (_that) {
case _Organization() when $default != null:
return $default(_that.id,_that.name,_that.ownerId,_that.defaultEscalationPolicyId,_that.settings);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Organization implements Organization {
  const _Organization({required this.id, required this.name, required this.ownerId, required this.defaultEscalationPolicyId,  Map<String, Object?> settings = const <String, Object?>{}}): _settings = settings;
  factory _Organization.fromJson(Map<String, dynamic> json) => _$OrganizationFromJson(json);

@override final  String id;
@override final  String name;
@override final  String ownerId;
@override final  String defaultEscalationPolicyId;
 final  Map<String, Object?> _settings;
@override@JsonKey() Map<String, Object?> get settings {
  if (_settings is EqualUnmodifiableMapView) return _settings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_settings);
}


/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrganizationCopyWith<_Organization> get copyWith => __$OrganizationCopyWithImpl<_Organization>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OrganizationToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Organization&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.ownerId, ownerId) || other.ownerId == ownerId)&&(identical(other.defaultEscalationPolicyId, defaultEscalationPolicyId) || other.defaultEscalationPolicyId == defaultEscalationPolicyId)&&const DeepCollectionEquality().equals(other.settings, _settings));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,ownerId,defaultEscalationPolicyId,const DeepCollectionEquality().hash(_settings));
}

@override
String toString() {
    return 'Organization(id: $id, name: $name, ownerId: $ownerId, defaultEscalationPolicyId: $defaultEscalationPolicyId, settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$OrganizationCopyWith<$Res> implements $OrganizationCopyWith<$Res> {
  factory _$OrganizationCopyWith(_Organization value, $Res Function(_Organization) _then) = __$OrganizationCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String ownerId, String defaultEscalationPolicyId, Map<String, Object?> settings
});




}
/// @nodoc
class __$OrganizationCopyWithImpl<$Res>
    implements _$OrganizationCopyWith<$Res> {
  __$OrganizationCopyWithImpl(this._self, this._then);

  final _Organization _self;
  final $Res Function(_Organization) _then;

/// Create a copy of Organization
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? ownerId = null,Object? defaultEscalationPolicyId = null,Object? settings = null,}) {
  return _then(_Organization(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ownerId: null == ownerId ? _self.ownerId : ownerId // ignore: cast_nullable_to_non_nullable
as String,defaultEscalationPolicyId: null == defaultEscalationPolicyId ? _self.defaultEscalationPolicyId : defaultEscalationPolicyId // ignore: cast_nullable_to_non_nullable
as String,settings: null == settings ? _self._settings : settings // ignore: cast_nullable_to_non_nullable
as Map<String, Object?>,
  ));
}


}

// dart format on
