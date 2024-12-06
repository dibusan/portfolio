import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/shared/responsive/device.dart';

class ResponsiveWidget extends StatelessWidget {
  final Widget Function(BuildContext) buildMovil;
  final Widget Function(BuildContext) buildDesktop;

  const ResponsiveWidget({
    Key? key,
    required this.buildMovil,
    required this.buildDesktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return context.isMobile ? buildMovil(context) : buildDesktop(context);
  }
}
