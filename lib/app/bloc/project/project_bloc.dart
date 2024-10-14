import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/data/service/firebase/cloud_firestore.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'project_event.dart';

part 'project_state.dart';

part 'project_bloc.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  String defaultDeveloper = 'eriel';

  ProjectBloc() : super(const ProjectState()) {
    if (kIsWeb) {
      final uri = Uri.base;
      defaultDeveloper = uri.host;
    }

    on<ProjectEventStarted>((event, emit) async {
      DeveloperInfo developerInfo = await CloudFireStore.instance.getInfo(defaultDeveloper);
      emit(state.copyWith(
        loading: false,
        requesting: false,
        developer: developerInfo.developer,
        projects: developerInfo.projects,
      ));
    });
    on<ProjectEventSelect>((event, emit) {
      emit(state.copyWith(selected: event.project));
    });
    on<ProjectEventUpdate>((event, emit) async {
      if (state.developer == null) return;
      emit(state.copyWith(requesting: true));
      if (event.projectId == null) {
        add(ProjectEventCreate(project: event.project));
        return;
      }
      await CloudFireStore.instance.updateProject(state.developer!.id, event.projectId!, event.project.toJson());
      add(const ProjectEventStarted());
    });
    on<ProjectEventCreate>((event, emit) async {
      if (state.developer == null) return;
      emit(state.copyWith(requesting: true));
      await CloudFireStore.instance.createProject(state.developer!.id, event.project);
      add(const ProjectEventStarted());
    });
  }
}
