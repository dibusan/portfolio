import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/app/presentation/home/home_web.dart';
import 'package:portfolio_eriel/app/presentation/home/responsive_home.dart';
import 'package:portfolio_eriel/app/presentation/resume_pdf/resume.dart';
import 'package:portfolio_eriel/app/presentation/security/security_page.dart';

enum AppRoute {
  home,
  security,
  resume,
  ;

  static AppRoute getCurrentRoute(BuildContext context) {
    final routeName = GoRouterState.of(context).topRoute?.name;
    return switch (routeName) {
      'home' => AppRoute.home,
      'security' => AppRoute.security,
      _ => throw Exception('This $routeName has not been add as AppRoute enum member'),
    };
  }
}

final rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

// GoRouter configuration
final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      builder: (context, state) => const ResponsiveHome(),
      routes: [
        GoRoute(path: 'resume', name: AppRoute.resume.name, builder: (context, state) => const ResumePdf()),
        GoRoute(path: 'security', name: AppRoute.security.name, builder: (context, state) => const SecurityPage()),
      ],
    ),
  ],
);
