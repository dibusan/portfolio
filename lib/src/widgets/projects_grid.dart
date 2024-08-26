import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:portfolio_eriel/src/widgets/project_preview_card.dart';

import '../data/models/project.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;

  const ProjectsGrid({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    var projects = buildProjectPreviews();

    return DynamicHeightGridView(
      itemCount: projects.length,
      crossAxisCount: 2,
      builder: (context, index) {
        return const ProjectPreviewCard();
      },
    );
  }

  List<Widget> buildProjectPreviews() {
    return projects.map((p) {
      return const ProjectPreviewCard();
    }).toList();
  }
}
