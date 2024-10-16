part of 'project_bloc.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default(true) bool loading,
    @Default(false) bool requesting,
    Developer? developer,
    @Default([]) List<Project> projects,
    Project? selected,
  }) = _ProjectState;
}
