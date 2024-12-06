import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum ScreenSize {
  mobile,
  tablet,
  desktop,
}

extension ScreenSizeX on BuildContext {
  ScreenSize screenSize([BreakPoint? breakpoint]) {
    breakpoint ??= BreakPoint.instance;
    final mediaQueryData = MediaQuery.of(this);
    final screenWidth = mediaQueryData.size.width;
    final screenHeight = mediaQueryData.size.height;
    final isLandscape = mediaQueryData.orientation == Orientation.landscape;

    return breakpoint.screenType(
      kIsWeb ? screenWidth : (isLandscape ? screenHeight : screenWidth),
    );
  }

  bool get isMobile => screenSize() == ScreenSize.mobile;

  bool get isTablet => screenSize() == ScreenSize.tablet;

  bool get isTabletOrLarger => screenSize() == ScreenSize.tablet || screenSize() == ScreenSize.desktop;

  bool get isDesktop => screenSize() == ScreenSize.desktop;

  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 100;

  EdgeInsets get contentPadding {
    final screen = screenSize();
    switch (screen) {
      case ScreenSize.mobile:
      case ScreenSize.tablet:
      case ScreenSize.desktop:
        return const EdgeInsets.symmetric(horizontal: 1.2 * Sizes.unit, vertical: 1.2 * Sizes.unit);
    }
  }
}

class BreakPoint {
  final num tablet;
  final num desktop;

  static BreakPoint? _instance;

  static BreakPoint get instance {
    return _instance ?? const BreakPoint.material();
  }

  static void setDefaultBreakPoint(BreakPoint breakPoint) {
    _instance = breakPoint;
  }

  const BreakPoint({required this.tablet, required this.desktop});

  const BreakPoint.android() : this(tablet: 720, desktop: 1080);

  const BreakPoint.material() : this(tablet: 800, desktop: 1200);

  const BreakPoint.windows() : this(tablet: 800, desktop: 1200);

  const BreakPoint.cupertino() : this(tablet: 900, desktop: 1300);

  bool isMobile(double size) => size < tablet;

  bool isTablet(double size) => size > tablet && size < desktop;

  bool isDesktop(double size) => size > desktop;

  ScreenSize screenType(double shortestSide) {
    if (shortestSide > desktop) return ScreenSize.desktop;
    if (shortestSide > tablet) return ScreenSize.tablet;
    return ScreenSize.mobile;
  }
}

class Sizes {
  static const unit = 16;
  static const xxs = 0.125 * unit;
  static const xs = 0.25 * unit;
  static const sm = 0.5 * unit;
  static const md = 0.75 * unit;
  static const lg = unit;
  static const xl = 1.5 * unit;
  static const xxl = 2 * unit;

  static const double edgeInsetsPhone = sm;
  static const double edgeInsetsTablet = md;
  static const double edgeInsetsDesktop = xl;

  static double responsiveInsets(BuildContext context) {
    final screen = context.screenSize();

    switch (screen) {
      case ScreenSize.mobile:
        return edgeInsetsPhone;
      case ScreenSize.tablet:
        return edgeInsetsTablet;
      case ScreenSize.desktop:
        return edgeInsetsDesktop;
    }
  }
}

class Device {
  static final isMobileDevice = !kIsWeb && (Platform.isIOS || Platform.isAndroid);
  static final isAndroid = !kIsWeb && Platform.isAndroid;
  static final isIOS = !kIsWeb && Platform.isIOS;

  static final isDesktopDevice = !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);
  static final isLinux = !kIsWeb && Platform.isLinux;
  static final isMacOS = !kIsWeb && Platform.isMacOS;
  static final isWindows = !kIsWeb && Platform.isWindows;

  static const isWeb = kIsWeb;
}


