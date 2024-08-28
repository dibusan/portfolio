import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/filters.dart';
import 'package:portfolio_eriel/app/presentation/home/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class ProjectPreviewCard extends StatelessWidget {
  final Project project;

  const ProjectPreviewCard({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        bool isSelected = state.selected?.id == project.id;
        return Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(89, 148, 227, 0.1),
                  offset: Offset(0, 2),
                  blurRadius: 10,
                ),
              ],
            ),
            // --- Top Level Card
            child: Card(
              margin: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
              clipBehavior: Clip.hardEdge,
              color: isSelected ? Colors.grey.shade200 : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () =>
                    BlocProvider.of<ProjectBloc>(context).add(ProjectEventSelect(project: isSelected ? null : project)),
                // --- First Level Column
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ProjectLogo(imageUrl: project.logoUrl),
                          const HSp8(),
                          Expanded(child: ProjectMiniInfoSection(project: project)),
                        ],
                      ),
                      const VSp8(),
                      TechTagsWrap(
                        techTags: project.techTags,
                        only4: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
