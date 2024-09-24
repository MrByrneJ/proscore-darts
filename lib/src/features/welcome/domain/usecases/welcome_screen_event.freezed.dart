// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'welcome_screen_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WelcomeScreenEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String displayName) userInputting,
    required TResult Function() inputtingComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String displayName)? userInputting,
    TResult? Function()? inputtingComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String displayName)? userInputting,
    TResult Function()? inputtingComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInputting value) userInputting,
    required TResult Function(InputtingComplete value) inputtingComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInputting value)? userInputting,
    TResult? Function(InputtingComplete value)? inputtingComplete,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInputting value)? userInputting,
    TResult Function(InputtingComplete value)? inputtingComplete,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WelcomeScreenEventCopyWith<$Res> {
  factory $WelcomeScreenEventCopyWith(
          WelcomeScreenEvent value, $Res Function(WelcomeScreenEvent) then) =
      _$WelcomeScreenEventCopyWithImpl<$Res, WelcomeScreenEvent>;
}

/// @nodoc
class _$WelcomeScreenEventCopyWithImpl<$Res, $Val extends WelcomeScreenEvent>
    implements $WelcomeScreenEventCopyWith<$Res> {
  _$WelcomeScreenEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WelcomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$UserInputtingImplCopyWith<$Res> {
  factory _$$UserInputtingImplCopyWith(
          _$UserInputtingImpl value, $Res Function(_$UserInputtingImpl) then) =
      __$$UserInputtingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String displayName});
}

/// @nodoc
class __$$UserInputtingImplCopyWithImpl<$Res>
    extends _$WelcomeScreenEventCopyWithImpl<$Res, _$UserInputtingImpl>
    implements _$$UserInputtingImplCopyWith<$Res> {
  __$$UserInputtingImplCopyWithImpl(
      _$UserInputtingImpl _value, $Res Function(_$UserInputtingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WelcomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? displayName = null,
  }) {
    return _then(_$UserInputtingImpl(
      null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UserInputtingImpl implements UserInputting {
  const _$UserInputtingImpl(this.displayName);

  @override
  final String displayName;

  @override
  String toString() {
    return 'WelcomeScreenEvent.userInputting(displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInputtingImpl &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, displayName);

  /// Create a copy of WelcomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInputtingImplCopyWith<_$UserInputtingImpl> get copyWith =>
      __$$UserInputtingImplCopyWithImpl<_$UserInputtingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String displayName) userInputting,
    required TResult Function() inputtingComplete,
  }) {
    return userInputting(displayName);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String displayName)? userInputting,
    TResult? Function()? inputtingComplete,
  }) {
    return userInputting?.call(displayName);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String displayName)? userInputting,
    TResult Function()? inputtingComplete,
    required TResult orElse(),
  }) {
    if (userInputting != null) {
      return userInputting(displayName);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInputting value) userInputting,
    required TResult Function(InputtingComplete value) inputtingComplete,
  }) {
    return userInputting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInputting value)? userInputting,
    TResult? Function(InputtingComplete value)? inputtingComplete,
  }) {
    return userInputting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInputting value)? userInputting,
    TResult Function(InputtingComplete value)? inputtingComplete,
    required TResult orElse(),
  }) {
    if (userInputting != null) {
      return userInputting(this);
    }
    return orElse();
  }
}

abstract class UserInputting implements WelcomeScreenEvent {
  const factory UserInputting(final String displayName) = _$UserInputtingImpl;

  String get displayName;

  /// Create a copy of WelcomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserInputtingImplCopyWith<_$UserInputtingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InputtingCompleteImplCopyWith<$Res> {
  factory _$$InputtingCompleteImplCopyWith(_$InputtingCompleteImpl value,
          $Res Function(_$InputtingCompleteImpl) then) =
      __$$InputtingCompleteImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InputtingCompleteImplCopyWithImpl<$Res>
    extends _$WelcomeScreenEventCopyWithImpl<$Res, _$InputtingCompleteImpl>
    implements _$$InputtingCompleteImplCopyWith<$Res> {
  __$$InputtingCompleteImplCopyWithImpl(_$InputtingCompleteImpl _value,
      $Res Function(_$InputtingCompleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of WelcomeScreenEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InputtingCompleteImpl implements InputtingComplete {
  const _$InputtingCompleteImpl();

  @override
  String toString() {
    return 'WelcomeScreenEvent.inputtingComplete()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InputtingCompleteImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String displayName) userInputting,
    required TResult Function() inputtingComplete,
  }) {
    return inputtingComplete();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String displayName)? userInputting,
    TResult? Function()? inputtingComplete,
  }) {
    return inputtingComplete?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String displayName)? userInputting,
    TResult Function()? inputtingComplete,
    required TResult orElse(),
  }) {
    if (inputtingComplete != null) {
      return inputtingComplete();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UserInputting value) userInputting,
    required TResult Function(InputtingComplete value) inputtingComplete,
  }) {
    return inputtingComplete(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UserInputting value)? userInputting,
    TResult? Function(InputtingComplete value)? inputtingComplete,
  }) {
    return inputtingComplete?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UserInputting value)? userInputting,
    TResult Function(InputtingComplete value)? inputtingComplete,
    required TResult orElse(),
  }) {
    if (inputtingComplete != null) {
      return inputtingComplete(this);
    }
    return orElse();
  }
}

abstract class InputtingComplete implements WelcomeScreenEvent {
  const factory InputtingComplete() = _$InputtingCompleteImpl;
}
