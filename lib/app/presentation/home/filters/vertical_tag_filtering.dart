import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/filters.dart';
import 'package:portfolio_eriel/app/presentation/home/filters/search_bar.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tag_wrap.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class VerticalTagFiltering extends StatelessWidget {
  final List<Project> projects;

  const VerticalTagFiltering({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<FilterBloc>(context);
          List<String> tags = Project.allTechTags(projects: projects);
          tags = tags
              .where(
                  (ele) => ele.toLowerCase().contains(state.filterTag.toLowerCase()) && !state.techTags.contains(ele))
              .toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Filter by tech"),
              FilterSearchBar(filterTagController: bloc.filterTagController),
              if (state.techTags.isNotEmpty) ...[
                const VSp10(),
                const SizedBox(width: 100, child: Divider()),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: double.maxFinite,
                  ),
                  child: TechTagsWrap(
                      techTags: state.techTags,
                      onRemove: (tagName) {
                        context.read<FilterBloc>().add(FilterEventTechTag(name: tagName, removed: true));
                      }),
                ),
              ],
              const VSp10(),
              const SizedBox(width: 100, child: Divider()),
              SizedBox(
                width: double.maxFinite,
                child: TechTagsWrap(
                  techTags: tags,
                  onTab: (tagName) {
                    context.read<FilterBloc>().add(FilterEventTechTag(name: tagName, removed: false));
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
