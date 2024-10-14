// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'security_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SecurityEvent {
  String get password => throw _privateConstructorUsedError;
  Developer get developer => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password, Developer developer)
        checkPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password, Developer developer)? checkPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password, Developer developer)? checkPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityCheckPasswordEvent value) checkPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityCheckPasswordEvent value)? checkPassword,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityCheckPasswordEvent value)? checkPassword,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityEventCopyWith<SecurityEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityEventCopyWith<$Res> {
  factory $SecurityEventCopyWith(
          SecurityEvent value, $Res Function(SecurityEvent) then) =
      _$SecurityEventCopyWithImpl<$Res, SecurityEvent>;
  @useResult
  $Res call({String password, Developer developer});

  $DeveloperCopyWith<$Res> get developer;
}

/// @nodoc
class _$SecurityEventCopyWithImpl<$Res, $Val extends SecurityEvent>
    implements $SecurityEventCopyWith<$Res> {
  _$SecurityEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? developer = null,
  }) {
    return _then(_value.copyWith(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer,
    ) as $Val);
  }

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DeveloperCopyWith<$Res> get developer {
    return $DeveloperCopyWith<$Res>(_value.developer, (value) {
      return _then(_value.copyWith(developer: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SecurityCheckPasswordEventImplCopyWith<$Res>
    implements $SecurityEventCopyWith<$Res> {
  factory _$$SecurityCheckPasswordEventImplCopyWith(
          _$SecurityCheckPasswordEventImpl value,
          $Res Function(_$SecurityCheckPasswordEventImpl) then) =
      __$$SecurityCheckPasswordEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String password, Developer developer});

  @override
  $DeveloperCopyWith<$Res> get developer;
}

/// @nodoc
class __$$SecurityCheckPasswordEventImplCopyWithImpl<$Res>
    extends _$SecurityEventCopyWithImpl<$Res, _$SecurityCheckPasswordEventImpl>
    implements _$$SecurityCheckPasswordEventImplCopyWith<$Res> {
  __$$SecurityCheckPasswordEventImplCopyWithImpl(
      _$SecurityCheckPasswordEventImpl _value,
      $Res Function(_$SecurityCheckPasswordEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? developer = null,
  }) {
    return _then(_$SecurityCheckPasswordEventImpl(
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer,
    ));
  }
}

/// @nodoc

class _$SecurityCheckPasswordEventImpl implements SecurityCheckPasswordEvent {
  const _$SecurityCheckPasswordEventImpl(
      {required this.password, required this.developer});

  @override
  final String password;
  @override
  final Developer developer;

  @override
  String toString() {
    return 'SecurityEvent.checkPassword(password: $password, developer: $developer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityCheckPasswordEventImpl &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.developer, developer) ||
                other.developer == developer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password, developer);

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityCheckPasswordEventImplCopyWith<_$SecurityCheckPasswordEventImpl>
      get copyWith => __$$SecurityCheckPasswordEventImplCopyWithImpl<
          _$SecurityCheckPasswordEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String password, Developer developer)
        checkPassword,
  }) {
    return checkPassword(password, developer);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String password, Developer developer)? checkPassword,
  }) {
    return checkPassword?.call(password, developer);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String password, Developer developer)? checkPassword,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(password, developer);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SecurityCheckPasswordEvent value) checkPassword,
  }) {
    return checkPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SecurityCheckPasswordEvent value)? checkPassword,
  }) {
    return checkPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SecurityCheckPasswordEvent value)? checkPassword,
    required TResult orElse(),
  }) {
    if (checkPassword != null) {
      return checkPassword(this);
    }
    return orElse();
  }
}

abstract class SecurityCheckPasswordEvent implements SecurityEvent {
  const factory SecurityCheckPasswordEvent(
      {required final String password,
      required final Developer developer}) = _$SecurityCheckPasswordEventImpl;

  @override
  String get password;
  @override
  Developer get developer;

  /// Create a copy of SecurityEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityCheckPasswordEventImplCopyWith<_$SecurityCheckPasswordEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SecurityState {
  bool get loading => throw _privateConstructorUsedError;
  bool get isAuth => throw _privateConstructorUsedError;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SecurityStateCopyWith<SecurityState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SecurityStateCopyWith<$Res> {
  factory $SecurityStateCopyWith(
          SecurityState value, $Res Function(SecurityState) then) =
      _$SecurityStateCopyWithImpl<$Res, SecurityState>;
  @useResult
  $Res call({bool loading, bool isAuth});
}

/// @nodoc
class _$SecurityStateCopyWithImpl<$Res, $Val extends SecurityState>
    implements $SecurityStateCopyWith<$Res> {
  _$SecurityStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isAuth = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SecurityStateImplCopyWith<$Res>
    implements $SecurityStateCopyWith<$Res> {
  factory _$$SecurityStateImplCopyWith(
          _$SecurityStateImpl value, $Res Function(_$SecurityStateImpl) then) =
      __$$SecurityStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool loading, bool isAuth});
}

/// @nodoc
class __$$SecurityStateImplCopyWithImpl<$Res>
    extends _$SecurityStateCopyWithImpl<$Res, _$SecurityStateImpl>
    implements _$$SecurityStateImplCopyWith<$Res> {
  __$$SecurityStateImplCopyWithImpl(
      _$SecurityStateImpl _value, $Res Function(_$SecurityStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? isAuth = null,
  }) {
    return _then(_$SecurityStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAuth: null == isAuth
          ? _value.isAuth
          : isAuth // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SecurityStateImpl implements _SecurityState {
  const _$SecurityStateImpl({this.loading = false, this.isAuth = true});

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool isAuth;

  @override
  String toString() {
    return 'SecurityState(loading: $loading, isAuth: $isAuth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SecurityStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.isAuth, isAuth) || other.isAuth == isAuth));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, isAuth);

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SecurityStateImplCopyWith<_$SecurityStateImpl> get copyWith =>
      __$$SecurityStateImplCopyWithImpl<_$SecurityStateImpl>(this, _$identity);
}

abstract class _SecurityState implements SecurityState {
  const factory _SecurityState({final bool loading, final bool isAuth}) =
      _$SecurityStateImpl;

  @override
  bool get loading;
  @override
  bool get isAuth;

  /// Create a copy of SecurityState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SecurityStateImplCopyWith<_$SecurityStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
