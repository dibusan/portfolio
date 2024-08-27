import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/bloc.dart';
import 'package:portfolio_eriel/app/bloc/event.dart';
import 'package:portfolio_eriel/app/bloc/state.dart';
import 'package:portfolio_eriel/app/shared/__.dart';
import 'package:portfolio_eriel/app/shared/filters/search_bar.dart';
import 'package:portfolio_eriel/domain/entities/__.dart';

class VerticalTagFiltering extends StatelessWidget {
  const VerticalTagFiltering({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.16,
      child: BlocBuilder<FilterBloc, FilterState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<FilterBloc>(context);
          List<String> tags = Project.allTechTags();
          tags = tags.where((ele) => ele.toLowerCase().contains(state.filterTag.toLowerCase())).toList();

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
                  child: buildTechTags(
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
                child: buildTechTags(
                    techTags: tags,
                    onTab: (tagName) {
                      context.read<FilterBloc>().add(FilterEventTechTag(name: tagName, removed: false));
                    }),
              ),
            ],
          );
        },
      ),
    );
  }
}
