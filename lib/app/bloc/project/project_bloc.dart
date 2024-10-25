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
      Project? project;
      if (event.projectId == null) {
        project = await CloudFireStore.instance.createProject(state.developer!.id, event.project);
      } else {
        project = await CloudFireStore.instance.updateProject(state.developer!.id, event.projectId!, event.project.toJson());
      }

      if (project == null) return add(const ProjectEventClose());
      event.onDone?.call(project);
      emit(state.copyWith(tempFileUploaded: []));
      add(const ProjectEventStarted());
    });
    on<ProjectEventUploadFile>((event, emit) async {
      emit(state.copyWith(requesting: true));
      FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image, allowMultiple: event.multiple);
      if (result == null) return add(const ProjectEventClose());
      List<String> uploadedFiles = [];

      for (var file in result.files) {
        Uint8List? bytes = file.bytes;
        String? name = file.name;
        if (bytes == null || state.developer == null) continue;
        final (String?, Exception?) uploadResult = await FireStoreService.uploadFile(
          developer: state.developer!,
          project: event.project,
          bytes: bytes,
          fileName: name,
          bucket: event.multiple ? StorageBuckets.images : StorageBuckets.logos,
        );
        if (uploadResult.$1 == null) continue;
        uploadedFiles.add(uploadResult.$1!);
      }

      emit(state.copyWith(tempFileUploaded: [...state.tempFileUploaded, ...uploadedFiles]));
      event.onResult?.call(uploadedFiles);
      return add(const ProjectEventClose());
    });
  }
}
