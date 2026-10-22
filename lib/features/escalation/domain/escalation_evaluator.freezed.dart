// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'escalation_evaluator.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$EscalationDecision {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EscalationDecision);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'EscalationDecision()';
}


}

/// @nodoc
class $EscalationDecisionCopyWith<$Res>  {
$EscalationDecisionCopyWith(EscalationDecision _, $Res Function(EscalationDecision) __);
}


/// Adds pattern-matching-related methods to [EscalationDecision].
extension EscalationDecisionPatterns on EscalationDecision {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NoEscalation value)?  none,TResult Function( Escalate value)?  escalate,TResult Function( NeedsAttention value)?  needsAttention,TResult Function( DeEscalate value)?  deEscalate,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NoEscalation() when none != null:
return none(_that);case Escalate() when escalate != null:
return escalate(_that);case NeedsAttention() when needsAttention != null:
return needsAttention(_that);case DeEscalate() when deEscalate != null:
return deEscalate(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NoEscalation value)  none,required TResult Function( Escalate value)  escalate,required TResult Function( NeedsAttention value)  needsAttention,required TResult Function( DeEscalate value)  deEscalate,}){
final _that = this;
switch (_that) {
case NoEscalation():
return none(_that);case Escalate():
return escalate(_that);case NeedsAttention():
return needsAttention(_that);case DeEscalate():
return deEscalate(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NoEscalation value)?  none,TResult? Function( Escalate value)?  escalate,TResult? Function( NeedsAttention value)?  needsAttention,TResult? Function( DeEscalate value)?  deEscalate,}){
final _that = this;
switch (_that) {
case NoEscalation() when none != null:
return none(_that);case Escalate() when escalate != null:
return escalate(_that);case NeedsAttention() when needsAttention != null:
return needsAttention(_that);case DeEscalate() when deEscalate != null:
return deEscalate(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime? nextEvaluationAt)?  none,TResult Function( EscalationTrigger trigger,  EscalationStep step,  String idempotencyKey,  int repeat)?  escalate,TResult Function( EscalationTrigger trigger)?  needsAttention,TResult Function( String reason)?  deEscalate,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NoEscalation() when none != null:
return none(_that.nextEvaluationAt);case Escalate() when escalate != null:
return escalate(_that.trigger,_that.step,_that.idempotencyKey,_that.repeat);case NeedsAttention() when needsAttention != null:
return needsAttention(_that.trigger);case DeEscalate() when deEscalate != null:
return deEscalate(_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime? nextEvaluationAt)  none,required TResult Function( EscalationTrigger trigger,  EscalationStep step,  String idempotencyKey,  int repeat)  escalate,required TResult Function( EscalationTrigger trigger)  needsAttention,required TResult Function( String reason)  deEscalate,}) {final _that = this;
switch (_that) {
case NoEscalation():
return none(_that.nextEvaluationAt);case Escalate():
return escalate(_that.trigger,_that.step,_that.idempotencyKey,_that.repeat);case NeedsAttention():
return needsAttention(_that.trigger);case DeEscalate():
return deEscalate(_that.reason);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime? nextEvaluationAt)?  none,TResult? Function( EscalationTrigger trigger,  EscalationStep step,  String idempotencyKey,  int repeat)?  escalate,TResult? Function( EscalationTrigger trigger)?  needsAttention,TResult? Function( String reason)?  deEscalate,}) {final _that = this;
switch (_that) {
case NoEscalation() when none != null:
return none(_that.nextEvaluationAt);case Escalate() when escalate != null:
return escalate(_that.trigger,_that.step,_that.idempotencyKey,_that.repeat);case NeedsAttention() when needsAttention != null:
return needsAttention(_that.trigger);case DeEscalate() when deEscalate != null:
return deEscalate(_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class NoEscalation implements EscalationDecision {
  const NoEscalation({this.nextEvaluationAt});
  

 final  DateTime? nextEvaluationAt;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NoEscalationCopyWith<NoEscalation> get copyWith => _$NoEscalationCopyWithImpl<NoEscalation>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NoEscalation&&(identical(other.nextEvaluationAt, nextEvaluationAt) || other.nextEvaluationAt == nextEvaluationAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,nextEvaluationAt);
}

@override
String toString() {
    return 'EscalationDecision.none(nextEvaluationAt: $nextEvaluationAt)';
}


}

/// @nodoc
abstract mixin class $NoEscalationCopyWith<$Res> implements $EscalationDecisionCopyWith<$Res> {
  factory $NoEscalationCopyWith(NoEscalation value, $Res Function(NoEscalation) _then) = _$NoEscalationCopyWithImpl;
@useResult
$Res call({
 DateTime? nextEvaluationAt
});




}
/// @nodoc
class _$NoEscalationCopyWithImpl<$Res>
    implements $NoEscalationCopyWith<$Res> {
  _$NoEscalationCopyWithImpl(this._self, this._then);

  final NoEscalation _self;
  final $Res Function(NoEscalation) _then;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nextEvaluationAt = freezed,}) {
  return _then(NoEscalation(
nextEvaluationAt: freezed == nextEvaluationAt ? _self.nextEvaluationAt : nextEvaluationAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc


class Escalate implements EscalationDecision {
  const Escalate({required this.trigger, required this.step, required this.idempotencyKey, required this.repeat});
  

 final  EscalationTrigger trigger;
 final  EscalationStep step;
 final  String idempotencyKey;
 final  int repeat;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EscalateCopyWith<Escalate> get copyWith => _$EscalateCopyWithImpl<Escalate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is Escalate&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.step, step) || other.step == step)&&(identical(other.idempotencyKey, idempotencyKey) || other.idempotencyKey == idempotencyKey)&&(identical(other.repeat, repeat) || other.repeat == repeat));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trigger,step,idempotencyKey,repeat);
}

@override
String toString() {
    return 'EscalationDecision.escalate(trigger: $trigger, step: $step, idempotencyKey: $idempotencyKey, repeat: $repeat)';
}


}

/// @nodoc
abstract mixin class $EscalateCopyWith<$Res> implements $EscalationDecisionCopyWith<$Res> {
  factory $EscalateCopyWith(Escalate value, $Res Function(Escalate) _then) = _$EscalateCopyWithImpl;
@useResult
$Res call({
 EscalationTrigger trigger, EscalationStep step, String idempotencyKey, int repeat
});


$EscalationStepCopyWith<$Res> get step;

}
/// @nodoc
class _$EscalateCopyWithImpl<$Res>
    implements $EscalateCopyWith<$Res> {
  _$EscalateCopyWithImpl(this._self, this._then);

  final Escalate _self;
  final $Res Function(Escalate) _then;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trigger = null,Object? step = null,Object? idempotencyKey = null,Object? repeat = null,}) {
  return _then(Escalate(
trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,step: null == step ? _self.step : step // ignore: cast_nullable_to_non_nullable
as EscalationStep,idempotencyKey: null == idempotencyKey ? _self.idempotencyKey : idempotencyKey // ignore: cast_nullable_to_non_nullable
as String,repeat: null == repeat ? _self.repeat : repeat // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EscalationStepCopyWith<$Res> get step {
  
  return $EscalationStepCopyWith<$Res>(_self.step, (value) {
    return _then(_self.copyWith(step: value));
  });
}
}

/// @nodoc


class NeedsAttention implements EscalationDecision {
  const NeedsAttention({required this.trigger});
  

 final  EscalationTrigger trigger;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NeedsAttentionCopyWith<NeedsAttention> get copyWith => _$NeedsAttentionCopyWithImpl<NeedsAttention>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is NeedsAttention&&(identical(other.trigger, trigger) || other.trigger == trigger));
}


@override
int get hashCode {
    return Object.hash(runtimeType,trigger);
}

@override
String toString() {
    return 'EscalationDecision.needsAttention(trigger: $trigger)';
}


}

/// @nodoc
abstract mixin class $NeedsAttentionCopyWith<$Res> implements $EscalationDecisionCopyWith<$Res> {
  factory $NeedsAttentionCopyWith(NeedsAttention value, $Res Function(NeedsAttention) _then) = _$NeedsAttentionCopyWithImpl;
@useResult
$Res call({
 EscalationTrigger trigger
});




}
/// @nodoc
class _$NeedsAttentionCopyWithImpl<$Res>
    implements $NeedsAttentionCopyWith<$Res> {
  _$NeedsAttentionCopyWithImpl(this._self, this._then);

  final NeedsAttention _self;
  final $Res Function(NeedsAttention) _then;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? trigger = null,}) {
  return _then(NeedsAttention(
trigger: null == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as EscalationTrigger,
  ));
}


}

/// @nodoc


class DeEscalate implements EscalationDecision {
  const DeEscalate({required this.reason});
  

 final  String reason;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeEscalateCopyWith<DeEscalate> get copyWith => _$DeEscalateCopyWithImpl<DeEscalate>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeEscalate&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,reason);
}

@override
String toString() {
    return 'EscalationDecision.deEscalate(reason: $reason)';
}


}

/// @nodoc
abstract mixin class $DeEscalateCopyWith<$Res> implements $EscalationDecisionCopyWith<$Res> {
  factory $DeEscalateCopyWith(DeEscalate value, $Res Function(DeEscalate) _then) = _$DeEscalateCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class _$DeEscalateCopyWithImpl<$Res>
    implements $DeEscalateCopyWith<$Res> {
  _$DeEscalateCopyWithImpl(this._self, this._then);

  final DeEscalate _self;
  final $Res Function(DeEscalate) _then;

/// Create a copy of EscalationDecision
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(DeEscalate(
reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
