part of 'project_bloc.dart';

@freezed
class ProjectEvent with _$ProjectEvent {
  const factory ProjectEvent.started() = ProjectEventStarted;

  const factory ProjectEvent.selectProject({Project? project}) = ProjectEventSelect;
}
