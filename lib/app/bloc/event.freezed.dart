// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateFilter dateTime) datetime,
    required TResult Function(String value) writeFilterTag,
    required TResult Function(String name, bool removed) techTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateFilter dateTime)? datetime,
    TResult? Function(String value)? writeFilterTag,
    TResult? Function(String name, bool removed)? techTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateFilter dateTime)? datetime,
    TResult Function(String value)? writeFilterTag,
    TResult Function(String name, bool removed)? techTag,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterEventInit value) init,
    required TResult Function(FilterEventDateTime value) datetime,
    required TResult Function(FilterEventWriteTag value) writeFilterTag,
    required TResult Function(FilterEventTechTag value) techTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterEventInit value)? init,
    TResult? Function(FilterEventDateTime value)? datetime,
    TResult? Function(FilterEventWriteTag value)? writeFilterTag,
    TResult? Function(FilterEventTechTag value)? techTag,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterEventInit value)? init,
    TResult Function(FilterEventDateTime value)? datetime,
    TResult Function(FilterEventWriteTag value)? writeFilterTag,
    TResult Function(FilterEventTechTag value)? techTag,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterEventCopyWith<$Res> {
  factory $FilterEventCopyWith(
          FilterEvent value, $Res Function(FilterEvent) then) =
      _$FilterEventCopyWithImpl<$Res, FilterEvent>;
}

/// @nodoc
class _$FilterEventCopyWithImpl<$Res, $Val extends FilterEvent>
    implements $FilterEventCopyWith<$Res> {
  _$FilterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$FilterEventInitImplCopyWith<$Res> {
  factory _$$FilterEventInitImplCopyWith(_$FilterEventInitImpl value,
          $Res Function(_$FilterEventInitImpl) then) =
      __$$FilterEventInitImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FilterEventInitImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterEventInitImpl>
    implements _$$FilterEventInitImplCopyWith<$Res> {
  __$$FilterEventInitImplCopyWithImpl(
      _$FilterEventInitImpl _value, $Res Function(_$FilterEventInitImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$FilterEventInitImpl implements FilterEventInit {
  const _$FilterEventInitImpl();

  @override
  String toString() {
    return 'FilterEvent.init()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FilterEventInitImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateFilter dateTime) datetime,
    required TResult Function(String value) writeFilterTag,
    required TResult Function(String name, bool removed) techTag,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateFilter dateTime)? datetime,
    TResult? Function(String value)? writeFilterTag,
    TResult? Function(String name, bool removed)? techTag,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateFilter dateTime)? datetime,
    TResult Function(String value)? writeFilterTag,
    TResult Function(String name, bool removed)? techTag,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterEventInit value) init,
    required TResult Function(FilterEventDateTime value) datetime,
    required TResult Function(FilterEventWriteTag value) writeFilterTag,
    required TResult Function(FilterEventTechTag value) techTag,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterEventInit value)? init,
    TResult? Function(FilterEventDateTime value)? datetime,
    TResult? Function(FilterEventWriteTag value)? writeFilterTag,
    TResult? Function(FilterEventTechTag value)? techTag,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterEventInit value)? init,
    TResult Function(FilterEventDateTime value)? datetime,
    TResult Function(FilterEventWriteTag value)? writeFilterTag,
    TResult Function(FilterEventTechTag value)? techTag,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class FilterEventInit implements FilterEvent {
  const factory FilterEventInit() = _$FilterEventInitImpl;
}

/// @nodoc
abstract class _$$FilterEventDateTimeImplCopyWith<$Res> {
  factory _$$FilterEventDateTimeImplCopyWith(_$FilterEventDateTimeImpl value,
          $Res Function(_$FilterEventDateTimeImpl) then) =
      __$$FilterEventDateTimeImplCopyWithImpl<$Res>;
  @useResult
  $Res call({DateFilter dateTime});
}

/// @nodoc
class __$$FilterEventDateTimeImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterEventDateTimeImpl>
    implements _$$FilterEventDateTimeImplCopyWith<$Res> {
  __$$FilterEventDateTimeImplCopyWithImpl(_$FilterEventDateTimeImpl _value,
      $Res Function(_$FilterEventDateTimeImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? dateTime = null,
  }) {
    return _then(_$FilterEventDateTimeImpl(
      dateTime: null == dateTime
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateFilter,
    ));
  }
}

/// @nodoc

class _$FilterEventDateTimeImpl implements FilterEventDateTime {
  const _$FilterEventDateTimeImpl({required this.dateTime});

  @override
  final DateFilter dateTime;

  @override
  String toString() {
    return 'FilterEvent.datetime(dateTime: $dateTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEventDateTimeImpl &&
            (identical(other.dateTime, dateTime) ||
                other.dateTime == dateTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, dateTime);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEventDateTimeImplCopyWith<_$FilterEventDateTimeImpl> get copyWith =>
      __$$FilterEventDateTimeImplCopyWithImpl<_$FilterEventDateTimeImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateFilter dateTime) datetime,
    required TResult Function(String value) writeFilterTag,
    required TResult Function(String name, bool removed) techTag,
  }) {
    return datetime(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateFilter dateTime)? datetime,
    TResult? Function(String value)? writeFilterTag,
    TResult? Function(String name, bool removed)? techTag,
  }) {
    return datetime?.call(dateTime);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateFilter dateTime)? datetime,
    TResult Function(String value)? writeFilterTag,
    TResult Function(String name, bool removed)? techTag,
    required TResult orElse(),
  }) {
    if (datetime != null) {
      return datetime(dateTime);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterEventInit value) init,
    required TResult Function(FilterEventDateTime value) datetime,
    required TResult Function(FilterEventWriteTag value) writeFilterTag,
    required TResult Function(FilterEventTechTag value) techTag,
  }) {
    return datetime(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterEventInit value)? init,
    TResult? Function(FilterEventDateTime value)? datetime,
    TResult? Function(FilterEventWriteTag value)? writeFilterTag,
    TResult? Function(FilterEventTechTag value)? techTag,
  }) {
    return datetime?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterEventInit value)? init,
    TResult Function(FilterEventDateTime value)? datetime,
    TResult Function(FilterEventWriteTag value)? writeFilterTag,
    TResult Function(FilterEventTechTag value)? techTag,
    required TResult orElse(),
  }) {
    if (datetime != null) {
      return datetime(this);
    }
    return orElse();
  }
}

abstract class FilterEventDateTime implements FilterEvent {
  const factory FilterEventDateTime({required final DateFilter dateTime}) =
      _$FilterEventDateTimeImpl;

  DateFilter get dateTime;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterEventDateTimeImplCopyWith<_$FilterEventDateTimeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterEventWriteTagImplCopyWith<$Res> {
  factory _$$FilterEventWriteTagImplCopyWith(_$FilterEventWriteTagImpl value,
          $Res Function(_$FilterEventWriteTagImpl) then) =
      __$$FilterEventWriteTagImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String value});
}

/// @nodoc
class __$$FilterEventWriteTagImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterEventWriteTagImpl>
    implements _$$FilterEventWriteTagImplCopyWith<$Res> {
  __$$FilterEventWriteTagImplCopyWithImpl(_$FilterEventWriteTagImpl _value,
      $Res Function(_$FilterEventWriteTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$FilterEventWriteTagImpl(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FilterEventWriteTagImpl implements FilterEventWriteTag {
  const _$FilterEventWriteTagImpl({this.value = ""});

  @override
  @JsonKey()
  final String value;

  @override
  String toString() {
    return 'FilterEvent.writeFilterTag(value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEventWriteTagImpl &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEventWriteTagImplCopyWith<_$FilterEventWriteTagImpl> get copyWith =>
      __$$FilterEventWriteTagImplCopyWithImpl<_$FilterEventWriteTagImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateFilter dateTime) datetime,
    required TResult Function(String value) writeFilterTag,
    required TResult Function(String name, bool removed) techTag,
  }) {
    return writeFilterTag(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateFilter dateTime)? datetime,
    TResult? Function(String value)? writeFilterTag,
    TResult? Function(String name, bool removed)? techTag,
  }) {
    return writeFilterTag?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateFilter dateTime)? datetime,
    TResult Function(String value)? writeFilterTag,
    TResult Function(String name, bool removed)? techTag,
    required TResult orElse(),
  }) {
    if (writeFilterTag != null) {
      return writeFilterTag(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterEventInit value) init,
    required TResult Function(FilterEventDateTime value) datetime,
    required TResult Function(FilterEventWriteTag value) writeFilterTag,
    required TResult Function(FilterEventTechTag value) techTag,
  }) {
    return writeFilterTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterEventInit value)? init,
    TResult? Function(FilterEventDateTime value)? datetime,
    TResult? Function(FilterEventWriteTag value)? writeFilterTag,
    TResult? Function(FilterEventTechTag value)? techTag,
  }) {
    return writeFilterTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterEventInit value)? init,
    TResult Function(FilterEventDateTime value)? datetime,
    TResult Function(FilterEventWriteTag value)? writeFilterTag,
    TResult Function(FilterEventTechTag value)? techTag,
    required TResult orElse(),
  }) {
    if (writeFilterTag != null) {
      return writeFilterTag(this);
    }
    return orElse();
  }
}

abstract class FilterEventWriteTag implements FilterEvent {
  const factory FilterEventWriteTag({final String value}) =
      _$FilterEventWriteTagImpl;

  String get value;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterEventWriteTagImplCopyWith<_$FilterEventWriteTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilterEventTechTagImplCopyWith<$Res> {
  factory _$$FilterEventTechTagImplCopyWith(_$FilterEventTechTagImpl value,
          $Res Function(_$FilterEventTechTagImpl) then) =
      __$$FilterEventTechTagImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String name, bool removed});
}

/// @nodoc
class __$$FilterEventTechTagImplCopyWithImpl<$Res>
    extends _$FilterEventCopyWithImpl<$Res, _$FilterEventTechTagImpl>
    implements _$$FilterEventTechTagImplCopyWith<$Res> {
  __$$FilterEventTechTagImplCopyWithImpl(_$FilterEventTechTagImpl _value,
      $Res Function(_$FilterEventTechTagImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? removed = null,
  }) {
    return _then(_$FilterEventTechTagImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      removed: null == removed
          ? _value.removed
          : removed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$FilterEventTechTagImpl implements FilterEventTechTag {
  const _$FilterEventTechTagImpl({required this.name, required this.removed});

  @override
  final String name;
  @override
  final bool removed;

  @override
  String toString() {
    return 'FilterEvent.techTag(name: $name, removed: $removed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterEventTechTagImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.removed, removed) || other.removed == removed));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, removed);

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterEventTechTagImplCopyWith<_$FilterEventTechTagImpl> get copyWith =>
      __$$FilterEventTechTagImplCopyWithImpl<_$FilterEventTechTagImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(DateFilter dateTime) datetime,
    required TResult Function(String value) writeFilterTag,
    required TResult Function(String name, bool removed) techTag,
  }) {
    return techTag(name, removed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(DateFilter dateTime)? datetime,
    TResult? Function(String value)? writeFilterTag,
    TResult? Function(String name, bool removed)? techTag,
  }) {
    return techTag?.call(name, removed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(DateFilter dateTime)? datetime,
    TResult Function(String value)? writeFilterTag,
    TResult Function(String name, bool removed)? techTag,
    required TResult orElse(),
  }) {
    if (techTag != null) {
      return techTag(name, removed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilterEventInit value) init,
    required TResult Function(FilterEventDateTime value) datetime,
    required TResult Function(FilterEventWriteTag value) writeFilterTag,
    required TResult Function(FilterEventTechTag value) techTag,
  }) {
    return techTag(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilterEventInit value)? init,
    TResult? Function(FilterEventDateTime value)? datetime,
    TResult? Function(FilterEventWriteTag value)? writeFilterTag,
    TResult? Function(FilterEventTechTag value)? techTag,
  }) {
    return techTag?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilterEventInit value)? init,
    TResult Function(FilterEventDateTime value)? datetime,
    TResult Function(FilterEventWriteTag value)? writeFilterTag,
    TResult Function(FilterEventTechTag value)? techTag,
    required TResult orElse(),
  }) {
    if (techTag != null) {
      return techTag(this);
    }
    return orElse();
  }
}

abstract class FilterEventTechTag implements FilterEvent {
  const factory FilterEventTechTag(
      {required final String name,
      required final bool removed}) = _$FilterEventTechTagImpl;

  String get name;
  bool get removed;

  /// Create a copy of FilterEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterEventTechTagImplCopyWith<_$FilterEventTechTagImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
