import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/app/shared/__.dart';

import '../../../../domain/entities/project/project.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectsGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
      itemCount: projects.length,
      crossAxisCount: 2,
      builder: (context, index) {
        return ProjectPreviewCard(project: projects[index]);
      },
    );
  }
}
