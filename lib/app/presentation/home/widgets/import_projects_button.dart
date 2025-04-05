import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/entities/project/project.dart';
import '../../../bloc/project/project_bloc.dart';

class ImportProjectsButton extends StatelessWidget {
  const ImportProjectsButton({super.key});

  Future<void> _importProjects(BuildContext context) async {
    try {
      // Pick a single JSON file
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['json'],
        withData: true, // Ensures we get bytes even on web
      );

      if (result == null || result.files.isEmpty) {
        return; // User canceled
      }

      final file = result.files.first;

      Uint8List? bytes = file.bytes;
      if (bytes == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not read file')),
        );
        return;
      }

      final content = utf8.decode(bytes);
      final List<dynamic> jsonList = jsonDecode(content);
      final projects = jsonList.map((e) => Project.fromJson(e)).toList();

      // Call your save method
      await saveProjectsToDatabase(context, projects);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Imported ${projects.length} projects.')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Import failed: $e')),
      );
    }
  }

  Future<void> saveProjectsToDatabase(BuildContext context, List<Project> projects) async {
    // 📝 TODO: Implement your logic to save to Firestore or any DB
    context.read<ProjectBloc>().add(ProjectEventBatchUpload(projects: projects));
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _importProjects(context),
      child: Text('Import Projects'),
    );
  }
}
