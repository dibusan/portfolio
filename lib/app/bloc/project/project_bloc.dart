import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'project_event.dart';

part 'project_state.dart';

part 'project_bloc.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState()) {
    on<ProjectEvent>((event, emit) {
      emit(state.copyWith(projects: Project.myProjects()));
    });
    on<ProjectEventSelect>((event, emit) {
      emit(state.copyWith(selected: event.project));
    });
  }
}
