import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio_eriel/app/shared/responsive/device.dart';
import 'package:portfolio_eriel/app/shared/responsive/sized_context.dart';

class ResponsiveView extends StatelessWidget {
  /// [mobileBuilder] draw UI for mobile devices;
  /// [webBuilder] (Optional) draw UI for wider screens as Web or Desktop
  ///

  ///
  /// It's especially useful for apps that want to maintain a consistent appearance
  /// across devices with different screen resolutions and responsive UI
  ///
  /// Example
  /// ```dart
  /// ResponsiveView(
  ///        webBuilder: (context, size) => const WebHome(),
  ///        mobileBuilder: ( context, size) => MobileHome(),
  /// )
  ///
  /// ```

  const ResponsiveView({
    super.key,
    required this.mobileBuilder,
    this.webBuilder,
  });

  /// builder for mobile views
  final Widget Function(BuildContext context, Size size) mobileBuilder;

  /// builder for web views
  final Widget Function(BuildContext context, Size size)? webBuilder;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.mq.size;

    if (context.isMobile) {
      return mobileBuilder(context, screenSize);
    }
    return webBuilder != null
        ? webBuilder!(context, screenSize)
        : mobileBuilder(context, screenSize);
  }
}

class UIScaler extends StatelessWidget {

  /// This Flutter widget takes care of scaling its child
  /// to fit different screen sizes proportionally.
  ///
  /// /// Calculates the scale factor by dividing the screen height by the reference
  /// height and taking the minimum value between this result and 1.0.
  /// This ensures that the scale factor will never be greater than 1,
  /// meaning that the widget will never become larger than the reference screen.
  const UIScaler({
    super.key,
    required this.child,
    this.alignment,
    this.referenceHeight = 1080,
  });

  /// [referenceHeight] : The reference height for calculating the scale.
  /// By default, it is set to 1080, but can be changed depending on the needs of the application.
  final int referenceHeight;

  /// Widget to apply scale
  final Widget child;

  /// [alignment] : The alignment of the scaled widget within its container.
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    final screenSize = context.mq.size;
    final double scale = min(screenSize.height / referenceHeight, 1.0);
    return Transform.scale(
      scale: scale,
      alignment: alignment,
      child: child,
    );
  }
}
