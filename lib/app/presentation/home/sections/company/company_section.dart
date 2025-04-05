import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/grid.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

import '../../widgets/export_projects_button.dart';

class CompanySection extends StatelessWidget {
  final List<Project> projects;
  final int divideLine;

  const CompanySection(
      {super.key, required this.projects, required this.divideLine});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Contract Work (${projects.length})",
            style: const TextStyle(fontSize: 20)),
        Expanded(child: GridSection(projects: projects, divideLine: divideLine))
      ],
    );
  }
}
