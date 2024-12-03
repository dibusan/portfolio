import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:portfolio_eriel/app/bloc/security/security_bloc.dart';

class MyHtmlText extends StatelessWidget {
  final HtmlEditorController controller;
  final String initialText;
  final bool enable;

  const MyHtmlText({
    super.key,
    required this.controller,
    this.initialText = "",
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SecurityBloc, SecurityState>(
      builder: (_, state) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          width: double.maxFinite,
          child: state.isAuth
              ? HtmlEditor(
                  controller: controller,
                  htmlEditorOptions: HtmlEditorOptions(
                    disabled: !enable,
                    hint: "Your text here...",
                    initialText: initialText,
                  ),
                )
              : HtmlWidget(initialText),
        );
      },
    );
  }
}

class MyFieldWithText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final InputDecoration? inputDecoration;
  final TextEditingController controller;
  final double? width;
  final bool enable;

  const MyFieldWithText({
    super.key,
    required this.controller,
    required this.text,
    this.textStyle,
    this.inputDecoration,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.width,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: BlocBuilder<SecurityBloc, SecurityState>(
        builder: (_, state) => state.isAuth
            ? TextFormField(
                enabled: enable,
                controller: controller,
                decoration: inputDecoration,
                maxLines: maxLines,
                textAlign: textAlign,
              )
            : Text(text, textAlign: textAlign, style: textStyle),
      ),
    );
  }
}
