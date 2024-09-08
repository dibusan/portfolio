import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/bloc.dart';
import 'package:portfolio_eriel/app/bloc/filter/event.dart';
import 'package:portfolio_eriel/app/bloc/filter/state.dart';
import 'package:portfolio_eriel/app/presentation/home/leftBar/search_bar.dart';
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Filter by tech",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const VSp8(),
              FilterSearchBar(filterTagController: bloc.filterTagController),
              if (state.techTags.isNotEmpty) ...[
                const VSp24(),
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 20,
                    minWidth: double.maxFinite,
                  ),
                  child: TechTagsWrap(
                      techTags: state.techTags,
                      textColor: Colors.black45,
                      onRemove: (tagName) {
                        context.read<FilterBloc>().add(FilterEventTechTag(name: tagName, removed: true));
                      }),
                ),
              ],
              const VSp10(),
              const Divider(color: Colors.white),
              const VSp10(),
              SizedBox(
                width: double.maxFinite,
                child: TechTagsWrap(
                  techTags: tags,
                  textColor: Colors.black45,
                  onTab: (tagName) {
                    bloc.filterTagController.clear();
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
