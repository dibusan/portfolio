import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/project/project.dart';

class TechTagsWrap extends StatelessWidget {
  final List<String>? techTags;
  final Function(String)? onTab;
  final Function(String)? onRemove;
  final bool only4;

  const TechTagsWrap({
    super.key,
    this.techTags,
    this.onTab,
    this.onRemove,
    this.only4 = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (_, state) {
        List<String> tags = techTags ?? Project.allTechTags(projects: state.projects);

        List<String> visibleTags;
        bool hasMoreTags;

        if (only4) {
          visibleTags = tags.take(4).toList();
          hasMoreTags = tags.length > 4;
        } else {
          visibleTags = tags;
          hasMoreTags = false;
        }

        List<Widget> tagWidgets = visibleTags
            .map(
              (e) => TechTag(
                name: e,
                onTap: onTab == null ? null : () => onTab!.call(e),
                onRemoved: onRemove == null ? null : () => onRemove!.call(e),
              ),
            )
            .toList();

        if (hasMoreTags && only4) {
          tagWidgets.add(
            TechTag(
              name: "....",
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Hay más etiquetas')),
                );
              },
            ),
          );
        }

        return Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          children: tagWidgets,
        );
      },
    );
  }
}
