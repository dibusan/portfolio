import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/data/service/firebase/cloud_firestore.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'project_event.dart';

part 'project_state.dart';

part 'project_bloc.freezed.dart';

const String defaultDeveloper = 'eriel';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState()) {
    on<ProjectEvent>((event, emit) async {
      DeveloperInfo? developerInfo = await CloudFireStore.instance.getInfo(defaultDeveloper);

      if (kDebugMode || developerInfo == null) {
        Developer developer = await Developer.loadFromJson(defaultDeveloper);

        List<Project> projects = await Project.loadFromJson(developer.id);

        developerInfo = DeveloperInfo(developer, projects);
      }

      emit(state.copyWith(
        loading: false,
        developer: developerInfo.developer,
        projects: developerInfo.projects,
      ));
    });
    on<ProjectEventSelect>((event, emit) {
      emit(state.copyWith(selected: event.project));
    });
  }
}
