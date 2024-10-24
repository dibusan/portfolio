import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/project/project_bloc.dart';
import 'package:portfolio_eriel/domain/entities/project/project.dart';

class SearchTags extends StatefulWidget {
  final String hintText;
  final Function(String value)? submitted;
  final List<String>? suggestions;
  final Function(TextEditingController controller, FocusNode focusNode)? onBuild;
  final bool enable;
  final double maxHeigth;

  const SearchTags({super.key, this.submitted, this.onBuild, this.enable = true, this.suggestions, required this.hintText, this.maxHeigth = 150});

  @override
  State<SearchTags> createState() => _SearchTagsState();
}

class _SearchTagsState extends State<SearchTags> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  @override
  Widget build(BuildContext context) {
    final List<String> suggestions = widget.suggestions ?? Project.allTechTags(projects: BlocProvider.of<ProjectBloc>(context).state.projects);

    return Autocomplete<String>(
      onSelected: (value) {
        widget.submitted?.call(value);
        _controller.clear();
      },
      optionsBuilder: (TextEditingValue textEditingValue) {
        if (textEditingValue.text.isEmpty) {
          return const Iterable<String>.empty();
        }
        return suggestions.where((String option) => option.toLowerCase().contains(textEditingValue.text.toLowerCase()));
      },
      fieldViewBuilder: (BuildContext context, TextEditingController fieldTextEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
        _controller = fieldTextEditingController;
        _focusNode = focusNode;
        widget.onBuild?.call(_controller, _focusNode);
        return TextFormField(
          enabled: widget.enable,
          canRequestFocus: true,
          autofocus: false,
          controller: _controller,
          focusNode: focusNode,
          onFieldSubmitted: (String value) {
            widget.submitted?.call(value);
            _controller.clear();
            onFieldSubmitted.call();
            _focusNode.requestFocus();
          },
          style: const TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: widget.hintText,
            alignLabelWithHint: true,
            hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
          ),
        );
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<String> onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: Container(
              width: 150,
              height: widget.maxHeigth,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.withOpacity(0.5)),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index);
                  return InkWell(
                    onTap: () => onSelected(option),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        option,
                        style: const TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}

class TechTag extends StatefulWidget {
  final String name;
  final Function()? onTap;
  final Function()? onRemoved;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final List<String>? suggestions;

  const TechTag({
    super.key,
    required this.name,
    this.onTap,
    this.onRemoved,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black45,
    this.suggestions,
  });

  String get data => name;

  @override
  State<TechTag> createState() => _TechTagState();
}

class _TechTagState extends State<TechTag> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? widget.onRemoved,
      borderRadius: BorderRadius.circular(50),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          constraints: const BoxConstraints(minWidth: 50),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: widget.borderColor ?? Colors.white, width: 2),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(
                widget.name,
                style: TextStyle(color: widget.textColor, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              )),
              if (widget.onRemoved != null) ...[
                const SizedBox(width: 5),
                const CircleAvatar(radius: 8, child: Icon(Icons.close, size: 12)),
              ]
            ],
          )),
    );
  }
}
