import 'dart:convert';
import 'dart:io';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../domain/entities/project/project.dart';

// Web-specific
// Only import dart:html if on web
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;


class ExportProjectsButton extends StatelessWidget {
  final List<Project> projects;

  const ExportProjectsButton({Key? key, required this.projects}) : super(key: key);

  Future<void> _exportProjects(BuildContext context) async {
    try {
      // Convert projects list to JSON string
      String jsonString = jsonEncode(projects.map((p) => p.toJson()).toList());

      if (kIsWeb) {
        // 🌐 Handle file export for web
        final bytes = Uint8List.fromList(utf8.encode(jsonString));
        final blob = html.Blob([bytes], 'application/json');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.AnchorElement(href: url)
          ..setAttribute("download", "projects_export.json")
          ..click();
        html.Url.revokeObjectUrl(url);
      } else {
        // 📱 Handle file export for mobile/desktop
        final directory = await getTemporaryDirectory();
        final file = io.File('${directory.path}/projects_export.json');
        await file.writeAsString(jsonString);

        await Share.shareXFiles(
          [XFile(file.path)],
          text: 'Exported Projects Data',
        );
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Exported successfully!')),
      );
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Export failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _exportProjects(context),
      child: Text('Export Projects'),
    );
  }
}
