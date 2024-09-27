import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectDialog extends StatelessWidget {
  final Project project;

  const ProjectDialog({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GlassContainer.clearGlass(
      width: size.width * 0.6,
      borderRadius: BorderRadius.circular(20),
      borderColor: Colors.transparent,
      child: ProjectPage(
        project: project,
        borderRadius: BorderRadius.zero,
        onCloseTab: () => Navigator.pop(context),
      ),
    );
  }
}
