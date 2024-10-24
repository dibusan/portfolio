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
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
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

class _$ProjectEventStartedImpl
    with DiagnosticableTreeMixin
    implements ProjectEventStarted {
  const _$ProjectEventStartedImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProjectEvent.started'));
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
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
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
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
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

class _$ProjectEventSelectImpl
    with DiagnosticableTreeMixin
    implements ProjectEventSelect {
  const _$ProjectEventSelectImpl({this.project});

  @override
  final Project? project;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.selectProject(project: $project)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.selectProject'))
      ..add(DiagnosticsProperty('project', project));
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
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return selectProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return selectProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
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
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return selectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return selectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
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
abstract class _$$ProjectEventUpdateImplCopyWith<$Res> {
  factory _$$ProjectEventUpdateImplCopyWith(_$ProjectEventUpdateImpl value,
          $Res Function(_$ProjectEventUpdateImpl) then) =
      __$$ProjectEventUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? projectId, Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectEventUpdateImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventUpdateImpl>
    implements _$$ProjectEventUpdateImplCopyWith<$Res> {
  __$$ProjectEventUpdateImplCopyWithImpl(_$ProjectEventUpdateImpl _value,
      $Res Function(_$ProjectEventUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = freezed,
    Object? project = null,
  }) {
    return _then(_$ProjectEventUpdateImpl(
      projectId: freezed == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String?,
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ProjectEventUpdateImpl
    with DiagnosticableTreeMixin
    implements ProjectEventUpdate {
  const _$ProjectEventUpdateImpl({this.projectId, required this.project});

  @override
  final String? projectId;
  @override
  final Project project;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.updateProject(projectId: $projectId, project: $project)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.updateProject'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventUpdateImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, project);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventUpdateImplCopyWith<_$ProjectEventUpdateImpl> get copyWith =>
      __$$ProjectEventUpdateImplCopyWithImpl<_$ProjectEventUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return updateProject(projectId, project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return updateProject?.call(projectId, project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) {
    if (updateProject != null) {
      return updateProject(projectId, project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return updateProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return updateProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
    required TResult orElse(),
  }) {
    if (updateProject != null) {
      return updateProject(this);
    }
    return orElse();
  }
}

abstract class ProjectEventUpdate implements ProjectEvent {
  const factory ProjectEventUpdate(
      {final String? projectId,
      required final Project project}) = _$ProjectEventUpdateImpl;

  String? get projectId;
  Project get project;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventUpdateImplCopyWith<_$ProjectEventUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectEventDeleteImplCopyWith<$Res> {
  factory _$$ProjectEventDeleteImplCopyWith(_$ProjectEventDeleteImpl value,
          $Res Function(_$ProjectEventDeleteImpl) then) =
      __$$ProjectEventDeleteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String projectId, dynamic Function()? onDelete});
}

/// @nodoc
class __$$ProjectEventDeleteImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventDeleteImpl>
    implements _$$ProjectEventDeleteImplCopyWith<$Res> {
  __$$ProjectEventDeleteImplCopyWithImpl(_$ProjectEventDeleteImpl _value,
      $Res Function(_$ProjectEventDeleteImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? projectId = null,
    Object? onDelete = freezed,
  }) {
    return _then(_$ProjectEventDeleteImpl(
      projectId: null == projectId
          ? _value.projectId
          : projectId // ignore: cast_nullable_to_non_nullable
              as String,
      onDelete: freezed == onDelete
          ? _value.onDelete
          : onDelete // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$ProjectEventDeleteImpl
    with DiagnosticableTreeMixin
    implements ProjectEventDelete {
  const _$ProjectEventDeleteImpl({required this.projectId, this.onDelete});

  @override
  final String projectId;
  @override
  final dynamic Function()? onDelete;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.deleteProject(projectId: $projectId, onDelete: $onDelete)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.deleteProject'))
      ..add(DiagnosticsProperty('projectId', projectId))
      ..add(DiagnosticsProperty('onDelete', onDelete));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventDeleteImpl &&
            (identical(other.projectId, projectId) ||
                other.projectId == projectId) &&
            (identical(other.onDelete, onDelete) ||
                other.onDelete == onDelete));
  }

  @override
  int get hashCode => Object.hash(runtimeType, projectId, onDelete);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventDeleteImplCopyWith<_$ProjectEventDeleteImpl> get copyWith =>
      __$$ProjectEventDeleteImplCopyWithImpl<_$ProjectEventDeleteImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return deleteProject(projectId, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return deleteProject?.call(projectId, onDelete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(projectId, onDelete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return deleteProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return deleteProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
    required TResult orElse(),
  }) {
    if (deleteProject != null) {
      return deleteProject(this);
    }
    return orElse();
  }
}

abstract class ProjectEventDelete implements ProjectEvent {
  const factory ProjectEventDelete(
      {required final String projectId,
      final dynamic Function()? onDelete}) = _$ProjectEventDeleteImpl;

  String get projectId;
  dynamic Function()? get onDelete;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventDeleteImplCopyWith<_$ProjectEventDeleteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectEventCreateImplCopyWith<$Res> {
  factory _$$ProjectEventCreateImplCopyWith(_$ProjectEventCreateImpl value,
          $Res Function(_$ProjectEventCreateImpl) then) =
      __$$ProjectEventCreateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Project project});

  $ProjectCopyWith<$Res> get project;
}

/// @nodoc
class __$$ProjectEventCreateImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventCreateImpl>
    implements _$$ProjectEventCreateImplCopyWith<$Res> {
  __$$ProjectEventCreateImplCopyWithImpl(_$ProjectEventCreateImpl _value,
      $Res Function(_$ProjectEventCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? project = null,
  }) {
    return _then(_$ProjectEventCreateImpl(
      project: null == project
          ? _value.project
          : project // ignore: cast_nullable_to_non_nullable
              as Project,
    ));
  }

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProjectCopyWith<$Res> get project {
    return $ProjectCopyWith<$Res>(_value.project, (value) {
      return _then(_value.copyWith(project: value));
    });
  }
}

/// @nodoc

class _$ProjectEventCreateImpl
    with DiagnosticableTreeMixin
    implements ProjectEventCreate {
  const _$ProjectEventCreateImpl({required this.project});

  @override
  final Project project;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.createProject(project: $project)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.createProject'))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventCreateImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventCreateImplCopyWith<_$ProjectEventCreateImpl> get copyWith =>
      __$$ProjectEventCreateImplCopyWithImpl<_$ProjectEventCreateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return createProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return createProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) {
    if (createProject != null) {
      return createProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return createProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return createProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
    required TResult orElse(),
  }) {
    if (createProject != null) {
      return createProject(this);
    }
    return orElse();
  }
}

abstract class ProjectEventCreate implements ProjectEvent {
  const factory ProjectEventCreate({required final Project project}) =
      _$ProjectEventCreateImpl;

  Project get project;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventCreateImplCopyWith<_$ProjectEventCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectEventUploadFileImplCopyWith<$Res> {
  factory _$$ProjectEventUploadFileImplCopyWith(
          _$ProjectEventUploadFileImpl value,
          $Res Function(_$ProjectEventUploadFileImpl) then) =
      __$$ProjectEventUploadFileImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {dynamic Function(List<String>)? onResult,
      bool multiple,
      Project? project});

  $ProjectCopyWith<$Res>? get project;
}

/// @nodoc
class __$$ProjectEventUploadFileImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventUploadFileImpl>
    implements _$$ProjectEventUploadFileImplCopyWith<$Res> {
  __$$ProjectEventUploadFileImplCopyWithImpl(
      _$ProjectEventUploadFileImpl _value,
      $Res Function(_$ProjectEventUploadFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? onResult = freezed,
    Object? multiple = null,
    Object? project = freezed,
  }) {
    return _then(_$ProjectEventUploadFileImpl(
      onResult: freezed == onResult
          ? _value.onResult
          : onResult // ignore: cast_nullable_to_non_nullable
              as dynamic Function(List<String>)?,
      multiple: null == multiple
          ? _value.multiple
          : multiple // ignore: cast_nullable_to_non_nullable
              as bool,
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

class _$ProjectEventUploadFileImpl
    with DiagnosticableTreeMixin
    implements ProjectEventUploadFile {
  const _$ProjectEventUploadFileImpl(
      {this.onResult, this.multiple = false, this.project});

  @override
  final dynamic Function(List<String>)? onResult;
  @override
  @JsonKey()
  final bool multiple;
  @override
  final Project? project;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.uploadFile(onResult: $onResult, multiple: $multiple, project: $project)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.uploadFile'))
      ..add(DiagnosticsProperty('onResult', onResult))
      ..add(DiagnosticsProperty('multiple', multiple))
      ..add(DiagnosticsProperty('project', project));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventUploadFileImpl &&
            (identical(other.onResult, onResult) ||
                other.onResult == onResult) &&
            (identical(other.multiple, multiple) ||
                other.multiple == multiple) &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, onResult, multiple, project);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventUploadFileImplCopyWith<_$ProjectEventUploadFileImpl>
      get copyWith => __$$ProjectEventUploadFileImplCopyWithImpl<
          _$ProjectEventUploadFileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return uploadFile(onResult, multiple, project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return uploadFile?.call(onResult, multiple, project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) {
    if (uploadFile != null) {
      return uploadFile(onResult, multiple, project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return uploadFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return uploadFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
    required TResult orElse(),
  }) {
    if (uploadFile != null) {
      return uploadFile(this);
    }
    return orElse();
  }
}

abstract class ProjectEventUploadFile implements ProjectEvent {
  const factory ProjectEventUploadFile(
      {final dynamic Function(List<String>)? onResult,
      final bool multiple,
      final Project? project}) = _$ProjectEventUploadFileImpl;

  dynamic Function(List<String>)? get onResult;
  bool get multiple;
  Project? get project;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventUploadFileImplCopyWith<_$ProjectEventUploadFileImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProjectEventCloseImplCopyWith<$Res> {
  factory _$$ProjectEventCloseImplCopyWith(_$ProjectEventCloseImpl value,
          $Res Function(_$ProjectEventCloseImpl) then) =
      __$$ProjectEventCloseImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<String> removeTempFile});
}

/// @nodoc
class __$$ProjectEventCloseImplCopyWithImpl<$Res>
    extends _$ProjectEventCopyWithImpl<$Res, _$ProjectEventCloseImpl>
    implements _$$ProjectEventCloseImplCopyWith<$Res> {
  __$$ProjectEventCloseImplCopyWithImpl(_$ProjectEventCloseImpl _value,
      $Res Function(_$ProjectEventCloseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? removeTempFile = null,
  }) {
    return _then(_$ProjectEventCloseImpl(
      removeTempFile: null == removeTempFile
          ? _value._removeTempFile
          : removeTempFile // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ProjectEventCloseImpl
    with DiagnosticableTreeMixin
    implements ProjectEventClose {
  const _$ProjectEventCloseImpl({final List<String> removeTempFile = const []})
      : _removeTempFile = removeTempFile;

  final List<String> _removeTempFile;
  @override
  @JsonKey()
  List<String> get removeTempFile {
    if (_removeTempFile is EqualUnmodifiableListView) return _removeTempFile;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_removeTempFile);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectEvent.closeEvent(removeTempFile: $removeTempFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectEvent.closeEvent'))
      ..add(DiagnosticsProperty('removeTempFile', removeTempFile));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectEventCloseImpl &&
            const DeepCollectionEquality()
                .equals(other._removeTempFile, _removeTempFile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_removeTempFile));

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProjectEventCloseImplCopyWith<_$ProjectEventCloseImpl> get copyWith =>
      __$$ProjectEventCloseImplCopyWithImpl<_$ProjectEventCloseImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Project? project) selectProject,
    required TResult Function(String? projectId, Project project) updateProject,
    required TResult Function(String projectId, dynamic Function()? onDelete)
        deleteProject,
    required TResult Function(Project project) createProject,
    required TResult Function(dynamic Function(List<String>)? onResult,
            bool multiple, Project? project)
        uploadFile,
    required TResult Function(List<String> removeTempFile) closeEvent,
  }) {
    return closeEvent(removeTempFile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Project? project)? selectProject,
    TResult? Function(String? projectId, Project project)? updateProject,
    TResult? Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult? Function(Project project)? createProject,
    TResult? Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult? Function(List<String> removeTempFile)? closeEvent,
  }) {
    return closeEvent?.call(removeTempFile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Project? project)? selectProject,
    TResult Function(String? projectId, Project project)? updateProject,
    TResult Function(String projectId, dynamic Function()? onDelete)?
        deleteProject,
    TResult Function(Project project)? createProject,
    TResult Function(dynamic Function(List<String>)? onResult, bool multiple,
            Project? project)?
        uploadFile,
    TResult Function(List<String> removeTempFile)? closeEvent,
    required TResult orElse(),
  }) {
    if (closeEvent != null) {
      return closeEvent(removeTempFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProjectEventStarted value) started,
    required TResult Function(ProjectEventSelect value) selectProject,
    required TResult Function(ProjectEventUpdate value) updateProject,
    required TResult Function(ProjectEventDelete value) deleteProject,
    required TResult Function(ProjectEventCreate value) createProject,
    required TResult Function(ProjectEventUploadFile value) uploadFile,
    required TResult Function(ProjectEventClose value) closeEvent,
  }) {
    return closeEvent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProjectEventStarted value)? started,
    TResult? Function(ProjectEventSelect value)? selectProject,
    TResult? Function(ProjectEventUpdate value)? updateProject,
    TResult? Function(ProjectEventDelete value)? deleteProject,
    TResult? Function(ProjectEventCreate value)? createProject,
    TResult? Function(ProjectEventUploadFile value)? uploadFile,
    TResult? Function(ProjectEventClose value)? closeEvent,
  }) {
    return closeEvent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProjectEventStarted value)? started,
    TResult Function(ProjectEventSelect value)? selectProject,
    TResult Function(ProjectEventUpdate value)? updateProject,
    TResult Function(ProjectEventDelete value)? deleteProject,
    TResult Function(ProjectEventCreate value)? createProject,
    TResult Function(ProjectEventUploadFile value)? uploadFile,
    TResult Function(ProjectEventClose value)? closeEvent,
    required TResult orElse(),
  }) {
    if (closeEvent != null) {
      return closeEvent(this);
    }
    return orElse();
  }
}

abstract class ProjectEventClose implements ProjectEvent {
  const factory ProjectEventClose({final List<String> removeTempFile}) =
      _$ProjectEventCloseImpl;

  List<String> get removeTempFile;

  /// Create a copy of ProjectEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectEventCloseImplCopyWith<_$ProjectEventCloseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProjectState {
  bool get loading => throw _privateConstructorUsedError;
  bool get requesting => throw _privateConstructorUsedError;
  Developer? get developer => throw _privateConstructorUsedError;
  List<Project> get projects => throw _privateConstructorUsedError;
  List<String> get tempFileUploaded => throw _privateConstructorUsedError;
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
      bool requesting,
      Developer? developer,
      List<Project> projects,
      List<String> tempFileUploaded,
      Project? selected});

  $DeveloperCopyWith<$Res>? get developer;
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
    Object? requesting = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? tempFileUploaded = null,
    Object? selected = freezed,
  }) {
    return _then(_value.copyWith(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      requesting: null == requesting
          ? _value.requesting
          : requesting // ignore: cast_nullable_to_non_nullable
              as bool,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer?,
      projects: null == projects
          ? _value.projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      tempFileUploaded: null == tempFileUploaded
          ? _value.tempFileUploaded
          : tempFileUploaded // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $DeveloperCopyWith<$Res>? get developer {
    if (_value.developer == null) {
      return null;
    }

    return $DeveloperCopyWith<$Res>(_value.developer!, (value) {
      return _then(_value.copyWith(developer: value) as $Val);
    });
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
      bool requesting,
      Developer? developer,
      List<Project> projects,
      List<String> tempFileUploaded,
      Project? selected});

  @override
  $DeveloperCopyWith<$Res>? get developer;
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
    Object? requesting = null,
    Object? developer = freezed,
    Object? projects = null,
    Object? tempFileUploaded = null,
    Object? selected = freezed,
  }) {
    return _then(_$ProjectStateImpl(
      loading: null == loading
          ? _value.loading
          : loading // ignore: cast_nullable_to_non_nullable
              as bool,
      requesting: null == requesting
          ? _value.requesting
          : requesting // ignore: cast_nullable_to_non_nullable
              as bool,
      developer: freezed == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as Developer?,
      projects: null == projects
          ? _value._projects
          : projects // ignore: cast_nullable_to_non_nullable
              as List<Project>,
      tempFileUploaded: null == tempFileUploaded
          ? _value._tempFileUploaded
          : tempFileUploaded // ignore: cast_nullable_to_non_nullable
              as List<String>,
      selected: freezed == selected
          ? _value.selected
          : selected // ignore: cast_nullable_to_non_nullable
              as Project?,
    ));
  }
}

/// @nodoc

class _$ProjectStateImpl with DiagnosticableTreeMixin implements _ProjectState {
  const _$ProjectStateImpl(
      {this.loading = true,
      this.requesting = false,
      this.developer,
      final List<Project> projects = const [],
      final List<String> tempFileUploaded = const [],
      this.selected})
      : _projects = projects,
        _tempFileUploaded = tempFileUploaded;

  @override
  @JsonKey()
  final bool loading;
  @override
  @JsonKey()
  final bool requesting;
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

  final List<String> _tempFileUploaded;
  @override
  @JsonKey()
  List<String> get tempFileUploaded {
    if (_tempFileUploaded is EqualUnmodifiableListView)
      return _tempFileUploaded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tempFileUploaded);
  }

  @override
  final Project? selected;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProjectState(loading: $loading, requesting: $requesting, developer: $developer, projects: $projects, tempFileUploaded: $tempFileUploaded, selected: $selected)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProjectState'))
      ..add(DiagnosticsProperty('loading', loading))
      ..add(DiagnosticsProperty('requesting', requesting))
      ..add(DiagnosticsProperty('developer', developer))
      ..add(DiagnosticsProperty('projects', projects))
      ..add(DiagnosticsProperty('tempFileUploaded', tempFileUploaded))
      ..add(DiagnosticsProperty('selected', selected));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProjectStateImpl &&
            (identical(other.loading, loading) || other.loading == loading) &&
            (identical(other.requesting, requesting) ||
                other.requesting == requesting) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            const DeepCollectionEquality()
                .equals(other._tempFileUploaded, _tempFileUploaded) &&
            (identical(other.selected, selected) ||
                other.selected == selected));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      loading,
      requesting,
      developer,
      const DeepCollectionEquality().hash(_projects),
      const DeepCollectionEquality().hash(_tempFileUploaded),
      selected);

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
      final bool requesting,
      final Developer? developer,
      final List<Project> projects,
      final List<String> tempFileUploaded,
      final Project? selected}) = _$ProjectStateImpl;

  @override
  bool get loading;
  @override
  bool get requesting;
  @override
  Developer? get developer;
  @override
  List<Project> get projects;
  @override
  List<String> get tempFileUploaded;
  @override
  Project? get selected;

  /// Create a copy of ProjectState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProjectStateImplCopyWith<_$ProjectStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
