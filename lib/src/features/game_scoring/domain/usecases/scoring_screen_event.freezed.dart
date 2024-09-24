// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scoring_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ScoringScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScoringScreenEventCopyWith<$Res> {
  factory $ScoringScreenEventCopyWith(
          ScoringScreenEvent value, $Res Function(ScoringScreenEvent) then) =
      _$ScoringScreenEventCopyWithImpl<$Res, ScoringScreenEvent>;
}

/// @nodoc
class _$ScoringScreenEventCopyWithImpl<$Res, $Val extends ScoringScreenEvent>
    implements $ScoringScreenEventCopyWith<$Res> {
  _$ScoringScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SelectMatchImplCopyWith<$Res> {
  factory _$$SelectMatchImplCopyWith(
          _$SelectMatchImpl value, $Res Function(_$SelectMatchImpl) then) =
      __$$SelectMatchImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DartsMatch match});
}

/// @nodoc
class __$$SelectMatchImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$SelectMatchImpl>
    implements _$$SelectMatchImplCopyWith<$Res> {
  __$$SelectMatchImplCopyWithImpl(
      _$SelectMatchImpl _value, $Res Function(_$SelectMatchImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? match = null,
  }) {
    return _then(_$SelectMatchImpl(
      null == match
          ? _value.match
          : match // ignore: cast_nullable_to_non_nullable
              as DartsMatch,
    ));
  }
}

/// @nodoc

class _$SelectMatchImpl implements SelectMatch {
  const _$SelectMatchImpl(this.match);

  @override
  final DartsMatch match;

  @override
  String toString() {
    return 'ScoringScreenEvent.selectMatch(match: $match)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectMatchImpl &&
            (identical(other.match, match) || other.match == match));
  }

  @override
  int get hashCode => Object.hash(runtimeType, match);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectMatchImplCopyWith<_$SelectMatchImpl> get copyWith =>
      __$$SelectMatchImplCopyWithImpl<_$SelectMatchImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return selectMatch(match);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return selectMatch?.call(match);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (selectMatch != null) {
      return selectMatch(match);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return selectMatch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return selectMatch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (selectMatch != null) {
      return selectMatch(this);
    }
    return orElse();
  }
}

abstract class SelectMatch implements ScoringScreenEvent {
  const factory SelectMatch(final DartsMatch match) = _$SelectMatchImpl;

  DartsMatch get match;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectMatchImplCopyWith<_$SelectMatchImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StartGameImplCopyWith<$Res> {
  factory _$$StartGameImplCopyWith(
          _$StartGameImpl value, $Res Function(_$StartGameImpl) then) =
      __$$StartGameImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DartsMatch newMatch});
}

/// @nodoc
class __$$StartGameImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$StartGameImpl>
    implements _$$StartGameImplCopyWith<$Res> {
  __$$StartGameImplCopyWithImpl(
      _$StartGameImpl _value, $Res Function(_$StartGameImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newMatch = null,
  }) {
    return _then(_$StartGameImpl(
      null == newMatch
          ? _value.newMatch
          : newMatch // ignore: cast_nullable_to_non_nullable
              as DartsMatch,
    ));
  }
}

/// @nodoc

class _$StartGameImpl implements StartGame {
  const _$StartGameImpl(this.newMatch);

  @override
  final DartsMatch newMatch;

  @override
  String toString() {
    return 'ScoringScreenEvent.startGame(newMatch: $newMatch)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StartGameImpl &&
            (identical(other.newMatch, newMatch) ||
                other.newMatch == newMatch));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newMatch);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StartGameImplCopyWith<_$StartGameImpl> get copyWith =>
      __$$StartGameImplCopyWithImpl<_$StartGameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return startGame(newMatch);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return startGame?.call(newMatch);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(newMatch);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return startGame(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return startGame?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (startGame != null) {
      return startGame(this);
    }
    return orElse();
  }
}

abstract class StartGame implements ScoringScreenEvent {
  const factory StartGame(final DartsMatch newMatch) = _$StartGameImpl;

  DartsMatch get newMatch;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StartGameImplCopyWith<_$StartGameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectInputMethodImplCopyWith<$Res> {
  factory _$$SelectInputMethodImplCopyWith(_$SelectInputMethodImpl value,
          $Res Function(_$SelectInputMethodImpl) then) =
      __$$SelectInputMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ScoringInputMethod method});
}

/// @nodoc
class __$$SelectInputMethodImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$SelectInputMethodImpl>
    implements _$$SelectInputMethodImplCopyWith<$Res> {
  __$$SelectInputMethodImplCopyWithImpl(_$SelectInputMethodImpl _value,
      $Res Function(_$SelectInputMethodImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? method = null,
  }) {
    return _then(_$SelectInputMethodImpl(
      null == method
          ? _value.method
          : method // ignore: cast_nullable_to_non_nullable
              as ScoringInputMethod,
    ));
  }
}

/// @nodoc

class _$SelectInputMethodImpl implements SelectInputMethod {
  const _$SelectInputMethodImpl(this.method);

  @override
  final ScoringInputMethod method;

  @override
  String toString() {
    return 'ScoringScreenEvent.selectInputMethod(method: $method)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectInputMethodImpl &&
            (identical(other.method, method) || other.method == method));
  }

  @override
  int get hashCode => Object.hash(runtimeType, method);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectInputMethodImplCopyWith<_$SelectInputMethodImpl> get copyWith =>
      __$$SelectInputMethodImplCopyWithImpl<_$SelectInputMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return selectInputMethod(method);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return selectInputMethod?.call(method);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (selectInputMethod != null) {
      return selectInputMethod(method);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return selectInputMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return selectInputMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (selectInputMethod != null) {
      return selectInputMethod(this);
    }
    return orElse();
  }
}

abstract class SelectInputMethod implements ScoringScreenEvent {
  const factory SelectInputMethod(final ScoringInputMethod method) =
      _$SelectInputMethodImpl;

  ScoringInputMethod get method;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectInputMethodImplCopyWith<_$SelectInputMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SelectMultiplierImplCopyWith<$Res> {
  factory _$$SelectMultiplierImplCopyWith(_$SelectMultiplierImpl value,
          $Res Function(_$SelectMultiplierImpl) then) =
      __$$SelectMultiplierImplCopyWithImpl<$Res>;
  @useResult
  $Res call({SelectedMultiplier multiplier});
}

/// @nodoc
class __$$SelectMultiplierImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$SelectMultiplierImpl>
    implements _$$SelectMultiplierImplCopyWith<$Res> {
  __$$SelectMultiplierImplCopyWithImpl(_$SelectMultiplierImpl _value,
      $Res Function(_$SelectMultiplierImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? multiplier = null,
  }) {
    return _then(_$SelectMultiplierImpl(
      null == multiplier
          ? _value.multiplier
          : multiplier // ignore: cast_nullable_to_non_nullable
              as SelectedMultiplier,
    ));
  }
}

/// @nodoc

class _$SelectMultiplierImpl implements SelectMultiplier {
  const _$SelectMultiplierImpl(this.multiplier);

  @override
  final SelectedMultiplier multiplier;

  @override
  String toString() {
    return 'ScoringScreenEvent.selectMultiplier(multiplier: $multiplier)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelectMultiplierImpl &&
            (identical(other.multiplier, multiplier) ||
                other.multiplier == multiplier));
  }

  @override
  int get hashCode => Object.hash(runtimeType, multiplier);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SelectMultiplierImplCopyWith<_$SelectMultiplierImpl> get copyWith =>
      __$$SelectMultiplierImplCopyWithImpl<_$SelectMultiplierImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return selectMultiplier(multiplier);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return selectMultiplier?.call(multiplier);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (selectMultiplier != null) {
      return selectMultiplier(multiplier);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return selectMultiplier(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return selectMultiplier?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (selectMultiplier != null) {
      return selectMultiplier(this);
    }
    return orElse();
  }
}

abstract class SelectMultiplier implements ScoringScreenEvent {
  const factory SelectMultiplier(final SelectedMultiplier multiplier) =
      _$SelectMultiplierImpl;

  SelectedMultiplier get multiplier;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SelectMultiplierImplCopyWith<_$SelectMultiplierImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputIndicatedScoreImplCopyWith<$Res> {
  factory _$$InputIndicatedScoreImplCopyWith(_$InputIndicatedScoreImpl value,
          $Res Function(_$InputIndicatedScoreImpl) then) =
      __$$InputIndicatedScoreImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String keyed});
}

/// @nodoc
class __$$InputIndicatedScoreImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$InputIndicatedScoreImpl>
    implements _$$InputIndicatedScoreImplCopyWith<$Res> {
  __$$InputIndicatedScoreImplCopyWithImpl(_$InputIndicatedScoreImpl _value,
      $Res Function(_$InputIndicatedScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyed = null,
  }) {
    return _then(_$InputIndicatedScoreImpl(
      null == keyed
          ? _value.keyed
          : keyed // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InputIndicatedScoreImpl implements InputIndicatedScore {
  const _$InputIndicatedScoreImpl(this.keyed);

  @override
  final String keyed;

  @override
  String toString() {
    return 'ScoringScreenEvent.inputIndicatedScore(keyed: $keyed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InputIndicatedScoreImpl &&
            (identical(other.keyed, keyed) || other.keyed == keyed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyed);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InputIndicatedScoreImplCopyWith<_$InputIndicatedScoreImpl> get copyWith =>
      __$$InputIndicatedScoreImplCopyWithImpl<_$InputIndicatedScoreImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return inputIndicatedScore(keyed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return inputIndicatedScore?.call(keyed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (inputIndicatedScore != null) {
      return inputIndicatedScore(keyed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return inputIndicatedScore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return inputIndicatedScore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (inputIndicatedScore != null) {
      return inputIndicatedScore(this);
    }
    return orElse();
  }
}

abstract class InputIndicatedScore implements ScoringScreenEvent {
  const factory InputIndicatedScore(final String keyed) =
      _$InputIndicatedScoreImpl;

  String get keyed;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InputIndicatedScoreImplCopyWith<_$InputIndicatedScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ThrowDartImplCopyWith<$Res> {
  factory _$$ThrowDartImplCopyWith(
          _$ThrowDartImpl value, $Res Function(_$ThrowDartImpl) then) =
      __$$ThrowDartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Dart dartThrown});
}

/// @nodoc
class __$$ThrowDartImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$ThrowDartImpl>
    implements _$$ThrowDartImplCopyWith<$Res> {
  __$$ThrowDartImplCopyWithImpl(
      _$ThrowDartImpl _value, $Res Function(_$ThrowDartImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dartThrown = null,
  }) {
    return _then(_$ThrowDartImpl(
      null == dartThrown
          ? _value.dartThrown
          : dartThrown // ignore: cast_nullable_to_non_nullable
              as Dart,
    ));
  }
}

/// @nodoc

class _$ThrowDartImpl implements ThrowDart {
  const _$ThrowDartImpl(this.dartThrown);

  @override
  final Dart dartThrown;

  @override
  String toString() {
    return 'ScoringScreenEvent.throwDart(dartThrown: $dartThrown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThrowDartImpl &&
            (identical(other.dartThrown, dartThrown) ||
                other.dartThrown == dartThrown));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dartThrown);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThrowDartImplCopyWith<_$ThrowDartImpl> get copyWith =>
      __$$ThrowDartImplCopyWithImpl<_$ThrowDartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return throwDart(dartThrown);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return throwDart?.call(dartThrown);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (throwDart != null) {
      return throwDart(dartThrown);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return throwDart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return throwDart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (throwDart != null) {
      return throwDart(this);
    }
    return orElse();
  }
}

abstract class ThrowDart implements ScoringScreenEvent {
  const factory ThrowDart(final Dart dartThrown) = _$ThrowDartImpl;

  Dart get dartThrown;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThrowDartImplCopyWith<_$ThrowDartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SubmitScoredImplCopyWith<$Res> {
  factory _$$SubmitScoredImplCopyWith(
          _$SubmitScoredImpl value, $Res Function(_$SubmitScoredImpl) then) =
      __$$SubmitScoredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int keyed});
}

/// @nodoc
class __$$SubmitScoredImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$SubmitScoredImpl>
    implements _$$SubmitScoredImplCopyWith<$Res> {
  __$$SubmitScoredImplCopyWithImpl(
      _$SubmitScoredImpl _value, $Res Function(_$SubmitScoredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyed = null,
  }) {
    return _then(_$SubmitScoredImpl(
      null == keyed
          ? _value.keyed
          : keyed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SubmitScoredImpl implements SubmitScored {
  const _$SubmitScoredImpl(this.keyed);

  @override
  final int keyed;

  @override
  String toString() {
    return 'ScoringScreenEvent.submitScored(keyed: $keyed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitScoredImpl &&
            (identical(other.keyed, keyed) || other.keyed == keyed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyed);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitScoredImplCopyWith<_$SubmitScoredImpl> get copyWith =>
      __$$SubmitScoredImplCopyWithImpl<_$SubmitScoredImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return submitScored(keyed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return submitScored?.call(keyed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (submitScored != null) {
      return submitScored(keyed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return submitScored(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return submitScored?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (submitScored != null) {
      return submitScored(this);
    }
    return orElse();
  }
}

abstract class SubmitScored implements ScoringScreenEvent {
  const factory SubmitScored(final int keyed) = _$SubmitScoredImpl;

  int get keyed;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitScoredImplCopyWith<_$SubmitScoredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateNumberOfDartsThrownImplCopyWith<$Res> {
  factory _$$UpdateNumberOfDartsThrownImplCopyWith(
          _$UpdateNumberOfDartsThrownImpl value,
          $Res Function(_$UpdateNumberOfDartsThrownImpl) then) =
      __$$UpdateNumberOfDartsThrownImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int num});
}

/// @nodoc
class __$$UpdateNumberOfDartsThrownImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res,
        _$UpdateNumberOfDartsThrownImpl>
    implements _$$UpdateNumberOfDartsThrownImplCopyWith<$Res> {
  __$$UpdateNumberOfDartsThrownImplCopyWithImpl(
      _$UpdateNumberOfDartsThrownImpl _value,
      $Res Function(_$UpdateNumberOfDartsThrownImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? num = null,
  }) {
    return _then(_$UpdateNumberOfDartsThrownImpl(
      null == num
          ? _value.num
          : num // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$UpdateNumberOfDartsThrownImpl implements UpdateNumberOfDartsThrown {
  const _$UpdateNumberOfDartsThrownImpl(this.num);

  @override
  final int num;

  @override
  String toString() {
    return 'ScoringScreenEvent.updateNumberOfDartsThrown(num: $num)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateNumberOfDartsThrownImpl &&
            (identical(other.num, num) || other.num == num));
  }

  @override
  int get hashCode => Object.hash(runtimeType, num);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateNumberOfDartsThrownImplCopyWith<_$UpdateNumberOfDartsThrownImpl>
      get copyWith => __$$UpdateNumberOfDartsThrownImplCopyWithImpl<
          _$UpdateNumberOfDartsThrownImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return updateNumberOfDartsThrown(num);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return updateNumberOfDartsThrown?.call(num);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (updateNumberOfDartsThrown != null) {
      return updateNumberOfDartsThrown(num);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return updateNumberOfDartsThrown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return updateNumberOfDartsThrown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (updateNumberOfDartsThrown != null) {
      return updateNumberOfDartsThrown(this);
    }
    return orElse();
  }
}

abstract class UpdateNumberOfDartsThrown implements ScoringScreenEvent {
  const factory UpdateNumberOfDartsThrown(final int num) =
      _$UpdateNumberOfDartsThrownImpl;

  int get num;

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateNumberOfDartsThrownImplCopyWith<_$UpdateNumberOfDartsThrownImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EndLegImplCopyWith<$Res> {
  factory _$$EndLegImplCopyWith(
          _$EndLegImpl value, $Res Function(_$EndLegImpl) then) =
      __$$EndLegImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EndLegImplCopyWithImpl<$Res>
    extends _$ScoringScreenEventCopyWithImpl<$Res, _$EndLegImpl>
    implements _$$EndLegImplCopyWith<$Res> {
  __$$EndLegImplCopyWithImpl(
      _$EndLegImpl _value, $Res Function(_$EndLegImpl) _then)
      : super(_value, _then);

  /// Create a copy of ScoringScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EndLegImpl implements EndLeg {
  const _$EndLegImpl();

  @override
  String toString() {
    return 'ScoringScreenEvent.endLeg()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EndLegImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DartsMatch match) selectMatch,
    required TResult Function(DartsMatch newMatch) startGame,
    required TResult Function(ScoringInputMethod method) selectInputMethod,
    required TResult Function(SelectedMultiplier multiplier) selectMultiplier,
    required TResult Function(String keyed) inputIndicatedScore,
    required TResult Function(Dart dartThrown) throwDart,
    required TResult Function(int keyed) submitScored,
    required TResult Function(int num) updateNumberOfDartsThrown,
    required TResult Function() endLeg,
  }) {
    return endLeg();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DartsMatch match)? selectMatch,
    TResult? Function(DartsMatch newMatch)? startGame,
    TResult? Function(ScoringInputMethod method)? selectInputMethod,
    TResult? Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult? Function(String keyed)? inputIndicatedScore,
    TResult? Function(Dart dartThrown)? throwDart,
    TResult? Function(int keyed)? submitScored,
    TResult? Function(int num)? updateNumberOfDartsThrown,
    TResult? Function()? endLeg,
  }) {
    return endLeg?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DartsMatch match)? selectMatch,
    TResult Function(DartsMatch newMatch)? startGame,
    TResult Function(ScoringInputMethod method)? selectInputMethod,
    TResult Function(SelectedMultiplier multiplier)? selectMultiplier,
    TResult Function(String keyed)? inputIndicatedScore,
    TResult Function(Dart dartThrown)? throwDart,
    TResult Function(int keyed)? submitScored,
    TResult Function(int num)? updateNumberOfDartsThrown,
    TResult Function()? endLeg,
    required TResult orElse(),
  }) {
    if (endLeg != null) {
      return endLeg();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SelectMatch value) selectMatch,
    required TResult Function(StartGame value) startGame,
    required TResult Function(SelectInputMethod value) selectInputMethod,
    required TResult Function(SelectMultiplier value) selectMultiplier,
    required TResult Function(InputIndicatedScore value) inputIndicatedScore,
    required TResult Function(ThrowDart value) throwDart,
    required TResult Function(SubmitScored value) submitScored,
    required TResult Function(UpdateNumberOfDartsThrown value)
        updateNumberOfDartsThrown,
    required TResult Function(EndLeg value) endLeg,
  }) {
    return endLeg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SelectMatch value)? selectMatch,
    TResult? Function(StartGame value)? startGame,
    TResult? Function(SelectInputMethod value)? selectInputMethod,
    TResult? Function(SelectMultiplier value)? selectMultiplier,
    TResult? Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult? Function(ThrowDart value)? throwDart,
    TResult? Function(SubmitScored value)? submitScored,
    TResult? Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult? Function(EndLeg value)? endLeg,
  }) {
    return endLeg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SelectMatch value)? selectMatch,
    TResult Function(StartGame value)? startGame,
    TResult Function(SelectInputMethod value)? selectInputMethod,
    TResult Function(SelectMultiplier value)? selectMultiplier,
    TResult Function(InputIndicatedScore value)? inputIndicatedScore,
    TResult Function(ThrowDart value)? throwDart,
    TResult Function(SubmitScored value)? submitScored,
    TResult Function(UpdateNumberOfDartsThrown value)?
        updateNumberOfDartsThrown,
    TResult Function(EndLeg value)? endLeg,
    required TResult orElse(),
  }) {
    if (endLeg != null) {
      return endLeg(this);
    }
    return orElse();
  }
}

abstract class EndLeg implements ScoringScreenEvent {
  const factory EndLeg() = _$EndLegImpl;
}
