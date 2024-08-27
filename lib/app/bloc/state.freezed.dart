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
  bool get loading => throw _privateConstructorUsedError;
  Developer? get developer => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  List<String> get techTags => throw _privateConstructorUsedError;
  String get filterTag => throw _privateConstructorUsedError;
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
      {bool loading,
      Developer? developer,
      List<Project> projects,
      List<String> techTags,
      String filterTag,
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
    Object? loading = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? techTags = null,
    Object? filterTag = null,
    Object? dateFilter = freezed,
    Object? dates = null,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer?,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      techTags: null == techTags
          ? _value.techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
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
      {bool loading,
      Developer? developer,
      List<Project> projects,
      List<String> techTags,
      String filterTag,
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
    Object? loading = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? techTags = null,
    Object? filterTag = null,
    Object? dateFilter = freezed,
    Object? dates = null,
  }) {
    return _then(_$FilterStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer?,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      techTags: null == techTags
          ? _value._techTags
          : techTags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      filterTag: null == filterTag
          ? _value.filterTag
          : filterTag // ignore: cast_nullable_to_non_nullable
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
      {this.loading = true,
      this.developer,
      final List<Project> projects = const [],
      final List<String> techTags = const [],
      this.filterTag = "",
      this.dateFilter,
      final List<DateFilter> dates = const []})
      : _projects = projects,
        _techTags = techTags,
        _dates = dates;

  @override
  @JsonKey()
  final bool loading;
  @override
  final Developer? developer;
  final List<Project> _projects;
  @override
  @JsonKey()
  List<Project> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

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
    return 'FilterState(loading: $loading, developer: $developer, projects: $projects, techTags: $techTags, filterTag: $filterTag, dateFilter: $dateFilter, dates: $dates)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilterStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality().equals(other._techTags, _techTags) &&
            (identical(other.filterTag, filterTag) ||
                other.filterTag == filterTag) &&
            (identical(other.dateFilter, dateFilter) ||
                other.dateFilter == dateFilter) &&
            const DeepCollectionEquality().equals(other._dates, _dates));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      developer,
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(_techTags),
      filterTag,
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
      {final bool loading,
      final Developer? developer,
      final List<Project> projects,
      final List<String> techTags,
      final String filterTag,
      final DateFilter? dateFilter,
      final List<DateFilter> dates}) = _$FilterStateImpl;

  @override
  bool get loading;
  @override
  Developer? get developer;
  @override
  List<Project> get projects;
  @override
  List<String> get techTags;
  @override
  String get filterTag;
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
