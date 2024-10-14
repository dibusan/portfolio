part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.started() = ProjectEventStarted;

  const factory ProjectEvent.selectProject({Project? project}) = ProjectEventSelect;

  const factory ProjectEvent.updateProject({String? projectId, required Project project}) = ProjectEventUpdate;

  const factory ProjectEvent.deleteProject({required String projectId}) = ProjectEventDelete;

  const factory ProjectEvent.createProject({required Project project}) = ProjectEventCreate;
}
