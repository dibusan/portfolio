import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/data/service/firebase/cloud_firestore.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

part 'project_event.dart';

part 'project_state.dart';

part 'project_bloc.freezed.dart';

class ProjectBloc extends Bloc<ProjectEvent, ProjectState> {
  ProjectBloc() : super(const ProjectState()) {
    on<ProjectEvent>((event, emit) async {
      DeveloperInfo? developerInfo;
      if (kDebugMode) {
        List<Project> projects = await Project.loadFromJson();
        developerInfo = DeveloperInfo(Developer.eriel(), projects);
      } else {
        developerInfo = await CloudFireStore.instance.getInfo('eriel');
      }

      emit(state.copyWith(
        loading: false,
        developer: developerInfo?.developer,
        projects: developerInfo?.projects ?? [],
      ));
    });
    on<ProjectEventSelect>((event, emit) {
      emit(state.copyWith(selected: event.project));
    });
  }
}
