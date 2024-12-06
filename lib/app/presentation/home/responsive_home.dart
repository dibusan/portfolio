import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/home_movil.dart';
import 'package:portfolio_eriel/app/presentation/home/home_web.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/letf_bar.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/header.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/app/shared/responsive/widget.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ResponsiveHome extends StatefulWidget {
  const ResponsiveHome({super.key});

  @override
  State<ResponsiveHome> createState() => _ResponsiveHomeState();
}

class _ResponsiveHomeState extends State<ResponsiveHome> {
  @override
  void initState() {
    BlocProvider.of<FilterBloc>(context).add(const FilterEventInit());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          BlocBuilder<ProjectBloc, ProjectState>(builder: (context, stateProjects) {
            if (stateProjects.loading) return const Center(child: CircularProgressIndicator());
            return BlocBuilder<FilterBloc, FilterState>(builder: (_, stateFilters) {
              List<Project> projects = _projects(stateProjects, stateFilters);
              return ResponsiveWidget(
                buildMovil: (_) => Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(40),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: HeaderAppBar.searchField(context),
                      ),
                    ),
                    actions: [
                      HeaderAppBar.pdfReport(context),
                      HeaderAppBar.aboutMe(context, developer: stateProjects.developer),
                      HeaderAppBar.contactMe(context, developer: stateProjects.developer),
                      const HSp10(),
                    ],
                  ),
                  extendBodyBehindAppBar: true,
                  backgroundColor: Colors.transparent,
                  drawer: LeftBarSection(
                    projects: stateProjects.projects,
                    developer: stateProjects.developer,
                  ),
                  body: HomeMobilPage(projects: projects, developer: stateProjects.developer),
                ),
                buildDesktop: (_) => Row(
                  children: [
                    LeftBarSection(
                      projects: stateProjects.projects,
                      developer: stateProjects.developer,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            HeaderAppBar(developer: stateProjects.developer),
                            const Divider(),
                            Expanded(child: HomeWebPage(projects: projects, developer: stateProjects.developer))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            });
          })
        ],
      ),
    );
  }
}

_projects(stateProjects, stateFilters) {
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
    projects = projects.where((element) {
      DateTime dateFilterStart = stateFilters.dateFilter?.date ?? DateTime(2000);
      DateTime dateFilterEnd = DateTime.now();

      DateTime? projectStart = element.startDate;
      DateTime projectEnd = element.endDate ?? dateFilterEnd;

      if (projectStart == null) return false;

      bool isWithinFilter = projectEnd.isAfter(dateFilterStart) && projectStart.isBefore(dateFilterEnd);

      return isWithinFilter;
    }).toList();
  }
  return projects;
}
