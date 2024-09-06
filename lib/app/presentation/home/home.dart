import 'dart:math';

import 'package:aura_box/aura_box.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/filters.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/header.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';
import 'package:portfolio_eriel/main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    BlocProvider.of<FilterBloc>(context).add(const FilterEventInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, stateProjects) {
        return BlocBuilder<FilterBloc, FilterState>(builder: (_, stateFilters) {
          List<Project> projects = stateProjects.projects;
          List<String> tags = stateFilters.techTags;
          final String search = stateFilters.filterGeneral;
          if (tags.isNotEmpty) {
            projects = projects.where((project) => project.techTags.any((tag) => tags.contains(tag))).toList();
          }
          if (search.isNotEmpty) {
            projects = projects
                .where(
                  (element) =>
                      (element.title).toLowerCase().contains(
                            search.toLowerCase(),
                          ) ||
                      (element.subtitle ?? "").toLowerCase().contains(
                            search.toLowerCase(),
                          ) ||
                      (element.description ?? "").toLowerCase().contains(
                            search.toLowerCase(),
                          ) ||
                      (element.industries).where((i) => i.toLowerCase().contains(search.toLowerCase())).isNotEmpty,
                )
                .toList();
          }
          if (stateFilters.dateFilter?.title != 'All') {
            projects = projects
                .where((element) =>
                    (element.projectStartDate != null &&
                        stateFilters.dateFilter!.date.isAfter(element.projectStartDate!)) &&
                    (element.projectLaunchDate != null &&
                        stateFilters.dateFilter!.date.isBefore(element.projectLaunchDate!)))
                .toList();
          }
          final size = MediaQuery.of(context).size;

          return Scaffold(
            backgroundColor: Colors.grey.shade200,
            body: AuraBox(
              spots: [
                AuraSpot(
                  color: colorBlue.withOpacity(0.4),
                  radius: size.width * 0.5,
                  alignment: const Alignment(-0.7, 1),
                  blurRadius: 50,
                ),
                AuraSpot(
                  color: colorRed.withOpacity(0.4),
                  radius: size.width * 0.5,
                  alignment: const Alignment(0.9, 0.8),
                  blurRadius: 50,
                ),
              ],
              decoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Row(
                children: [
                  FilteringSection(projects: stateProjects.projects),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const HeaderAppBar(),
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  child: LayoutBuilder(
                                    builder: (_, constrains) => DynamicHeightGridView(
                                      itemCount: projects.length,
                                      crossAxisCount: (constrains.maxWidth / 350).toInt(),
                                      builder: (context, index) => ProjectPreviewCard(project: projects[index]),
                                    ),
                                  ),
                                ),
                                AnimatedContainer(
                                  constraints: BoxConstraints(minWidth: stateProjects.selected == null ? 0 : 350),
                                  width: stateProjects.selected == null ? 0 : size.width * 0.25,
                                  duration: const Duration(milliseconds: 600),
                                  child: ProjectPage(project: stateProjects.selected),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }
}
