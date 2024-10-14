import 'package:flutter/material.dart';

class TechTag extends StatelessWidget {
  final String name;
  final Function()? onTap;
  final Function()? onRemoved;
  final Color? borderColor;
  final Color? textColor;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String value)? submittedController;
  final List<String>? suggestions;

  const TechTag({
    super.key,
    required this.name,
    this.onTap,
    this.onRemoved,
    this.borderColor = Colors.white,
    this.backgroundColor = Colors.transparent,
    this.textColor = Colors.black45,
    this.controller,
    this.submittedController,
    this.suggestions,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: controller == null ? onTap ?? onRemoved : null,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: controller == null ? const EdgeInsets.symmetric(horizontal: 10, vertical: 5) : EdgeInsets.zero,
        constraints: BoxConstraints(minWidth: 50, maxWidth: controller == null ? double.infinity : 150),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: borderColor ?? Colors.white, width: 2),
        ),
        child: controller == null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                      child: Text(
                    name,
                    style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  )),
                  if (onRemoved != null) ...[
                    const SizedBox(width: 5),
                    const CircleAvatar(radius: 8, child: Icon(Icons.close, size: 12)),
                  ]
                ],
              )
            : Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty || suggestions == null) {
                    return const Iterable<String>.empty();
                  }
                  return suggestions!.where((String option) {
                    return option.toLowerCase().contains(textEditingValue.text.toLowerCase());
                  });
                },
                fieldViewBuilder:
                    (BuildContext context, TextEditingController fieldTextEditingController, FocusNode focusNode, VoidCallback onFieldSubmitted) {
                  return TextFormField(
                    controller: fieldTextEditingController,
                    focusNode: focusNode,
                    onFieldSubmitted: (String value) {
                      if (submittedController != null) {
                        submittedController!(value);
                      }
                    },
                    style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: "Type new Tag",
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
                        width: 200,
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
                              onTap: () {
                                onSelected(option);
                                if (submittedController != null) {
                                  submittedController!(option);
                                }
                              },
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
              ),
      ),
    );
  }
}
