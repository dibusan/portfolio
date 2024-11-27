import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/grid.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class PersonalSection extends StatelessWidget {
  final List<Project> projects;

  const PersonalSection({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [const Text("Personal projects",style: TextStyle(fontSize: 20),), Expanded(child: GridSection(projects: projects, divideLine: 2))],
    );
  }
}
