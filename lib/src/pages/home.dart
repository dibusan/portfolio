import 'package:flutter/material.dart';
import 'package:portfolio_eriel/src/data/models/developer.dart';
import 'package:portfolio_eriel/src/widgets/banner_with_profile_image.dart';
import 'package:portfolio_eriel/src/widgets/top_bar.dart';

import '../data/models/project.dart';
import '../widgets/filtering_seccion.dart';
import '../widgets/project_preview_card.dart';
import '../widgets/projects_grid.dart';
import '../widgets/project_details.dart';
import '../widgets/tmp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Developer yo = Developer.eriel();

    List<Project> projects = Project.myProjects();

    return Scaffold(
      backgroundColor: Color.fromARGB(1, 235, 239, 242),
      body: Row(
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 8),
            child: const FilteringSection(),
          ),
          Expanded(
            child: Wrap(
              children: [
                Column(
                  children: [
                    const Center(
                      child: TopBar(),
                    ),
                    Text('Total Projects: ${projects.length}'),
                    Row(
                      children: [
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.sizeOf(context).height,
                            maxWidth: MediaQuery.sizeOf(context).width / 2,
                          ),
                          child: ProjectsGrid(projects: projects),
                        ),
                        const Expanded(
                          child: ProjectDetails(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
