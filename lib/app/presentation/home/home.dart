import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/header.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/letf_bar.dart';
import 'package:portfolio_eriel/app/presentation/project/project.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/project_preview_card.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

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
                    (element.projectStartDate != null && stateFilters.dateFilter!.date.isAfter(element.projectStartDate!)) &&
                    (element.projectLaunchDate != null && stateFilters.dateFilter!.date.isBefore(element.projectLaunchDate!)))
                .toList();
          }
          final size = MediaQuery.of(context).size;

          return Scaffold(
            backgroundColor: Colors.grey.shade200,
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
                stateProjects.loading
                    ? const Center(child: CircularProgressIndicator())
                    : Container(
                        margin: const EdgeInsets.only(left: 300),
                        child: Row(
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                child: GlassContainer.clearGlass(
                                  borderColor: Colors.transparent,
                                  elevation: 40,
                                  color: Colors.white.withOpacity(0.2),
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 40, right: 20),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const HeaderAppBar(),
                                        Expanded(
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: LayoutBuilder(
                                                  builder: (_, constrains) => ScrollConfiguration(
                                                    behavior: MyCustomScrollBehavior(),
                                                    child: DynamicHeightGridView(
                                                      physics: const BouncingScrollPhysics(),
                                                      itemCount: projects.length,
                                                      crossAxisCount: (constrains.maxWidth / 350).toInt(),
                                                      builder: (context, index) => ProjectPreviewCard(project: projects[index]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            AnimatedContainer(
                              constraints: BoxConstraints(minWidth: stateProjects.selected == null ? 0 : 350),
                              width: stateProjects.selected == null ? 0 : size.width * 0.20,
                              duration: const Duration(milliseconds: 200),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 35, left: 15, right: 15),
                                child: ProjectPage(project: stateProjects.selected),
                              ),
                            ),
                          ],
                        ),
                      ),
                stateProjects.loading
                    ? const SizedBox()
                    : LeftBarSection(
                        projects: stateProjects.projects,
                        developer: stateProjects.developer,
                      ),
              ],
            ),
          );
        });
      },
    );
  }
}
