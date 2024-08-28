// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FilterState {
  List<String> get techTags => throw _privateConstructorUsedError;
  String get filterTag => throw _privateConstructorUsedError;
  String get filterGeneral => throw _privateConstructorUsedError;
  DateFilter? get dateFilter => throw _privateConstructorUsedError;
  List<DateFilter> get dates => throw _privateConstructorUsedError;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FilterStateCopyWith<FilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilterStateCopyWith<$Res> {
  factory $FilterStateCopyWith(
          FilterState value, $Res Function(FilterState) then) =
      _$FilterStateCopyWithImpl<$Res, FilterState>;
  @useResult
  $Res call(
      {List<String> techTags,
      String filterTag,
      String filterGeneral,
      DateFilter? dateFilter,
      List<DateFilter> dates});
}

/// @nodoc
class _$FilterStateCopyWithImpl<$Res, $Val extends FilterState>
    implements $FilterStateCopyWith<$Res> {
  _$FilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techTags = null,
    Object? filterTag = null,
    Object? filterGeneral = null,
    Object? dateFilter = freezed,
    Object? dates = null,
  }) {
    return _then(_value.copyWith(
      techTags: null == techTags
          ? _value.techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
              as String,
      filterGeneral: null == filterGeneral
          ? _value.filterGeneral
          : filterGeneral // ignore: cast_nullable_to_non_nullable
              as String,
      dateFilter: freezed == dateFilter
          ? _value.dateFilter
          : dateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter?,
      dates: null == dates
          ? _value.dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateFilter>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilterStateImplCopyWith<$Res>
    implements $FilterStateCopyWith<$Res> {
  factory _$$FilterStateImplCopyWith(
          _$FilterStateImpl value, $Res Function(_$FilterStateImpl) then) =
      __$$FilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> techTags,
      String filterTag,
      String filterGeneral,
      DateFilter? dateFilter,
      List<DateFilter> dates});
}

/// @nodoc
class __$$FilterStateImplCopyWithImpl<$Res>
    extends _$FilterStateCopyWithImpl<$Res, _$FilterStateImpl>
    implements _$$FilterStateImplCopyWith<$Res> {
  __$$FilterStateImplCopyWithImpl(
      _$FilterStateImpl _value, $Res Function(_$FilterStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? techTags = null,
    Object? filterTag = null,
    Object? filterGeneral = null,
    Object? dateFilter = freezed,
    Object? dates = null,
  }) {
    return _then(_$FilterStateImpl(
      techTags: null == techTags
          ? _value._techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
              as String,
      filterGeneral: null == filterGeneral
          ? _value.filterGeneral
          : filterGeneral // ignore: cast_nullable_to_non_nullable
              as String,
      dateFilter: freezed == dateFilter
          ? _value.dateFilter
          : dateFilter // ignore: cast_nullable_to_non_nullable
              as DateFilter?,
      dates: null == dates
          ? _value._dates
          : dates // ignore: cast_nullable_to_non_nullable
              as List<DateFilter>,
    ));
  }
}

/// @nodoc

class _$FilterStateImpl implements _FilterState {
  const _$FilterStateImpl(
      {final List<String> techTags = const [],
      this.filterTag = "",
      this.filterGeneral = "",
      this.dateFilter,
      final List<DateFilter> dates = const []})
      : _techTags = techTags,
        _dates = dates;

  final List<String> _techTags;
  @override
  @JsonKey()
  List<String> get techTags {
    if (_techTags is EqualUnmodifiableListView) return _techTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_techTags);
  }

  @override
  @JsonKey()
  final String filterTag;
  @override
  @JsonKey()
  final String filterGeneral;
  @override
  final DateFilter? dateFilter;
  final List<DateFilter> _dates;
  @override
  @JsonKey()
  List<DateFilter> get dates {
    if (_dates is EqualUnmodifiableListView) return _dates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_dates);
  }

  @override
  String toString() {
    return 'FilterState(techTags: $techTags, filterTag: $filterTag, filterGeneral: $filterGeneral, dateFilter: $dateFilter, dates: $dates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            const DeepCollectionEquality().equals(other._techTags, _techTags) &&
            (identical(other.filterTag, filterTag) ||
                other.filterTag == filterTag) &&
            (identical(other.filterGeneral, filterGeneral) ||
                other.filterGeneral == filterGeneral) &&
            (identical(other.dateFilter, dateFilter) ||
                other.dateFilter == dateFilter) &&
            const DeepCollectionEquality().equals(other._dates, _dates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_techTags),
      filterTag,
      filterGeneral,
      dateFilter,
      const DeepCollectionEquality().hash(_dates));

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      __$$FilterStateImplCopyWithImpl<_$FilterStateImpl>(this, _$identity);
}

abstract class _FilterState implements FilterState {
  const factory _FilterState(
      {final List<String> techTags,
      final String filterTag,
      final String filterGeneral,
      final DateFilter? dateFilter,
      final List<DateFilter> dates}) = _$FilterStateImpl;

  @override
  List<String> get techTags;
  @override
  String get filterTag;
  @override
  String get filterGeneral;
  @override
  DateFilter? get dateFilter;
  @override
  List<DateFilter> get dates;

  /// Create a copy of FilterState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FilterStateImplCopyWith<_$FilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
