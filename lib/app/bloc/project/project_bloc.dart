import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio_eriel/data/service/firebase/cloud_firestore.dart';
import 'package:portfolio_eriel/data/service/firebase/storage.dart';
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
      emit(state.copyWith(loading: false, requesting: false, developer: developerInfo.developer, projects: developerInfo.projects));
    });
    on<ProjectEventDelete>((event, emit) async {
      emit(state.copyWith(requesting: true));
      final resultDelete = await CloudFireStore.instance.deleteProject(developerId: state.developer!.id, projectId: event.projectId);
      if (resultDelete) {
        event.onDelete?.call();
        add(const ProjectEventStarted());
      } else {
        add(const ProjectEventClose());
      }
    });
    on<ProjectEventClose>((event, emit) async {
      for (var url in event.removeTempFile) {
        final exist = state.tempFileUploaded.where((e) => e == url).firstOrNull != null;
        if (!exist) continue;
        final (bool, Exception?) result = await FireStoreService.deleteFile(url);
        if (result.$1) {
          emit(state.copyWith(tempFileUploaded: state.tempFileUploaded.where((e) => e != url).toList()));
        }
      }

      emit(state.copyWith(requesting: false, loading: false));
    });
    on<ProjectEventUpdate>((event, emit) async {
      emit(state.copyWith(requesting: true));
      if (state.developer == null) return add(const ProjectEventClose());
      if (event.projectId == null) return add(ProjectEventCreate(project: event.project));
      Project? project = await CloudFireStore.instance.updateProject(state.developer!.id, event.projectId!, event.project.toJson());
      if (project == null) return add(const ProjectEventClose());
      emit(state.copyWith(tempFileUploaded: []));
      add(const ProjectEventStarted());
    });
    on<ProjectEventCreate>((event, emit) async {
      if (state.developer == null) return;
      emit(state.copyWith(requesting: true));
      await CloudFireStore.instance.createProject(state.developer!.id, event.project);
      add(const ProjectEventStarted());
    });
    on<ProjectEventUploadFile>((event, emit) async {
      emit(state.copyWith(requesting: true));
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return add(const ProjectEventClose());
      Uint8List? bytes = result.files.single.bytes;
      String? name = result.files.single.name;
      if (bytes == null || state.developer == null) return add(const ProjectEventClose());
      final (String?, Exception?) uploadResult = await FireStoreService.uploadFile(
          developer: state.developer!, project: event.project, bytes: bytes, fileName: name, bucket: StorageBuckets.logos);
      if (uploadResult.$1 == null) return add(const ProjectEventClose());

      emit(state.copyWith(tempFileUploaded: [...state.tempFileUploaded, uploadResult.$1!]));
      event.onResult?.call(uploadResult.$1);
      return add(const ProjectEventClose());
    });
  }
}
