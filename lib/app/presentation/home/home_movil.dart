import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/company/company_section.dart';
import 'package:portfolio_eriel/app/presentation/home/sections/personal/personal_section.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/header.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/letf_bar.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class HomeMobilPage extends StatelessWidget {
  final Developer? developer;
  final List<Project> projects;

  const HomeMobilPage({super.key, required this.developer, required this.projects});

  @override
  Widget build(BuildContext context) {
    List<Project> sortedProjects = List<Project>.from(projects)
      ..sort((a, b) {
        if (a.isPersonal && !b.isPersonal) return 1;
        if (!a.isPersonal && b.isPersonal) return -1;
        return 0;
      });
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ScrollConfiguration(
        behavior: MyCustomScrollBehavior(),
        child: ListView.separated(
          separatorBuilder: (_, index) => const VSp10(),
          itemBuilder: (_, index) => SizedBox(
            height: 400,
            width: double.maxFinite,
            child: ProjectPreviewCard(project: sortedProjects[index], showPersonal: true),
          ),
          itemCount: sortedProjects.length,
        ),
      ),
    );
  }
}
