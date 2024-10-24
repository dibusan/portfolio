part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.started() = ProjectEventStarted;

  const factory ProjectEvent.selectProject({Project? project}) = ProjectEventSelect;

  const factory ProjectEvent.updateProject({String? projectId, required Project project, Function(Project project)? onDone}) = ProjectEventUpdate;

  const factory ProjectEvent.deleteProject({required String projectId, Function()? onDelete}) = ProjectEventDelete;

  const factory ProjectEvent.createProject({required Project project}) = ProjectEventCreate;

  const factory ProjectEvent.uploadFile({Function(@Default([]) List<String> url)? onResult, @Default(false) bool multiple, Project? project}) =
      ProjectEventUploadFile;

  const factory ProjectEvent.closeEvent({@Default([]) List<String> removeTempFile}) = ProjectEventClose;
}
