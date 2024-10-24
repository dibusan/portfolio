import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio_eriel/app/bloc/security/security_bloc.dart';

class MyFieldWithText extends StatelessWidget {
  final TextStyle? textStyle;
  final String text;
  final int maxLines;
  final TextAlign textAlign;
  final InputDecoration? inputDecoration;
  final TextEditingController controller;
  final double? width;

  const MyFieldWithText({
    super.key,
    required this.controller,
    required this.text,
    this.textStyle,
    this.inputDecoration,
    this.maxLines = 1,
    this.textAlign = TextAlign.center,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: BlocBuilder<SecurityBloc, SecurityState>(
        builder: (_, state) => state.isAuth
            ? TextFormField(
                controller: controller,
                decoration: inputDecoration,
                maxLines: maxLines,
                textAlign: textAlign,
              )
            : Text(
                text,
                textAlign: textAlign,
                style: textStyle,
              ),
      ),
    );
  }
}
