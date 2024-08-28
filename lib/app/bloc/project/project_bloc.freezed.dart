// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'project_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProjectEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectEventCopyWith<$Res> {
  factory $ProjectEventCopyWith(
          ProjectEvent value, $Res Function(ProjectEvent) then) =
      _$ProjectEventCopyWithImpl<$Res, ProjectEvent>;
}

/// @nodoc
class _$ProjectEventCopyWithImpl<$Res, $Val extends ProjectEvent>
    implements $ProjectEventCopyWith<$Res> {
  _$ProjectEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProjectEventStartedImplCopyWith<$Res> {
  factory _$$ProjectEventStartedImplCopyWith(_$ProjectEventStartedImpl value,
          $Res Function(_$ProjectEventStartedImpl) then) =
      __$$ProjectEventStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProjectEventStartedImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventStartedImpl>
    implements _$$ProjectEventStartedImplCopyWith<$Res> {
  __$$ProjectEventStartedImplCopyWithImpl(_$ProjectEventStartedImpl _value,
      $Res Function(_$ProjectEventStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProjectEventStartedImpl implements ProjectEventStarted {
  const _$ProjectEventStartedImpl();

  @override
  String toString() {
    return 'ProjectEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class ProjectEventStarted implements ProjectEvent {
  const factory ProjectEventStarted() = _$ProjectEventStartedImpl;
}

/// @nodoc
abstract class _$$ProjectEventSelectImplCopyWith<$Res> {
  factory _$$ProjectEventSelectImplCopyWith(_$ProjectEventSelectImpl value,
          $Res Function(_$ProjectEventSelectImpl) then) =
      __$$ProjectEventSelectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Project? project});

  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ProjectEventSelectImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventSelectImpl>
    implements _$$ProjectEventSelectImplCopyWith<$Res> {
  __$$ProjectEventSelectImplCopyWithImpl(_$ProjectEventSelectImpl _value,
      $Res Function(_$ProjectEventSelectImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = freezed,
  }) {
    return _then(_$ProjectEventSelectImpl(
      project: freezed == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project?,
    ));
  }

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get project {
    if (_value.project == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.project!, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ProjectEventSelectImpl implements ProjectEventSelect {
  const _$ProjectEventSelectImpl({this.project});

  @override
  final Project? project;

  @override
  String toString() {
    return 'ProjectEvent.selectProject(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventSelectImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventSelectImplCopyWith<_$ProjectEventSelectImpl> get copyWith =>
      __$$ProjectEventSelectImplCopyWithImpl<_$ProjectEventSelectImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
  }) {
    return selectProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
  }) {
    return selectProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    required TResult orElse(),
  }) {
    if (selectProject != null) {
      return selectProject(this);
    }
    return orElse();
  }
}

abstract class ProjectEventSelect implements ProjectEvent {
  const factory ProjectEventSelect({final Project? project}) =
      _$ProjectEventSelectImpl;

  Project? get project;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventSelectImplCopyWith<_$ProjectEventSelectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectState {
  bool get loading => throw _privateConstructorUsedError;
  Developer? get developer => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  Project? get selected => throw _privateConstructorUsedError;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProjectStateCopyWith<ProjectState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProjectStateCopyWith<$Res> {
  factory $ProjectStateCopyWith(
          ProjectState value, $Res Function(ProjectState) then) =
      _$ProjectStateCopyWithImpl<$Res, ProjectState>;
  @useResult
  $Res call(
      {bool loading,
      Developer? developer,
      List<Project> projects,
      Project? selected});

  $ProjectCopyWith<$Res>? get selected;
}

/// @nodoc
class _$ProjectStateCopyWithImpl<$Res, $Val extends ProjectState>
    implements $ProjectStateCopyWith<$Res> {
  _$ProjectStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? selected = freezed,
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
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Project?,
    ) as $Val);
  }

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res>? get selected {
    if (_value.selected == null) {
      return null;
    }

    return $ProjectCopyWith<$Res>(_value.selected!, (value) {
      return _then(_value.copyWith(selected: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProjectStateImplCopyWith<$Res>
    implements $ProjectStateCopyWith<$Res> {
  factory _$$ProjectStateImplCopyWith(
          _$ProjectStateImpl value, $Res Function(_$ProjectStateImpl) then) =
      __$$ProjectStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool loading,
      Developer? developer,
      List<Project> projects,
      Project? selected});

  @override
  $ProjectCopyWith<$Res>? get selected;
}

/// @nodoc
class __$$ProjectStateImplCopyWithImpl<$Res>
    extends _$ProjectStateCopyWithImpl<$Res, _$ProjectStateImpl>
    implements _$$ProjectStateImplCopyWith<$Res> {
  __$$ProjectStateImplCopyWithImpl(
      _$ProjectStateImpl _value, $Res Function(_$ProjectStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loading = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? selected = freezed,
  }) {
    return _then(_$ProjectStateImpl(
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
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Project?,
    ));
  }
}

/// @nodoc

class _$ProjectStateImpl implements _ProjectState {
  const _$ProjectStateImpl(
      {this.loading = true,
      this.developer,
      final List<Project> projects = const [],
      this.selected})
      : _projects = projects;

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

  @override
  final Project? selected;

  @override
  String toString() {
    return 'ProjectState(loading: $loading, developer: $developer, projects: $projects, selected: $selected)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loading, developer,
      const DeepCollectionEquality().hash(_projects), selected);

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectStateImplCopyWith<_$ProjectStateImpl> get copyWith =>
      __$$ProjectStateImplCopyWithImpl<_$ProjectStateImpl>(this, _$identity);
}

abstract class _ProjectState implements ProjectState {
  const factory _ProjectState(
      {final bool loading,
      final Developer? developer,
      final List<Project> projects,
      final Project? selected}) = _$ProjectStateImpl;

  @override
  bool get loading;
  @override
  Developer? get developer;
  @override
  List<Project> get projects;
  @override
  Project? get selected;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStateImplCopyWith<_$ProjectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
