import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/app/presentation/project/widgets/tech_tags.dart';
import 'package:portfolio_eriel/domain/entities/project/project.dart';
import 'package:reorderables/reorderables.dart';

class TechTagsWrap extends StatefulWidget {
  final List<String>? techTags;
  final String keyWrap;
  final Function(int toIndex, int fromIndex)? techTagsOrder;
  final Function(String)? onTab;
  final Function(String)? onRemove;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;

  const TechTagsWrap({
    super.key,
    required this.keyWrap,
    this.techTags,
    this.onTab,
    this.onRemove,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.techTagsOrder,
  });

  @override
  State<TechTagsWrap> createState() => _TechTagsWrapState();
}

class _TechTagsWrapState extends State<TechTagsWrap> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (_, state) {
        List<String> tags = widget.techTags ?? Project.allTechTags(projects: state.projects);

        return SizedBox(
          width: double.maxFinite,
          child: PrimaryScrollController(
            controller: scrollController,
            child: ReorderableWrap(
              key: ValueKey(widget.keyWrap),
              enableReorder: widget.techTagsOrder != null,
              crossAxisAlignment: WrapCrossAlignment.center,
              runAlignment: WrapAlignment.center,
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 4.0,
              onReorder: (int oldIndex, int newIndex) {
                if (widget.techTags == null) return;
                widget.techTagsOrder?.call(newIndex, oldIndex);
              },
              children: tags
                  .map(
                    (t) => ReorderableWidget(
                      reorderable: true,
                      key: Key("${widget.key.toString()}-$t"),
                      child: TechTag(
                        name: t,
                        textColor: widget.textColor,
                        borderColor: widget.borderColor,
                        backgroundColor: widget.backgroundColor,
                        onTap: widget.onTab == null ? null : () => widget.onTab!.call(t),
                        onRemoved: widget.onRemove == null ? null : () => widget.onRemove!.call(t),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
