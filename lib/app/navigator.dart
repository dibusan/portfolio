import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio_eriel/app/presentation/home/home_web.dart';
import 'package:portfolio_eriel/app/presentation/home/responsive_home.dart';
import 'package:portfolio_eriel/app/presentation/resume/resume_page.dart';
import 'package:portfolio_eriel/app/presentation/resume_pdf/resume.dart';
import 'package:portfolio_eriel/app/presentation/secret/secret_page.dart';
import 'package:portfolio_eriel/app/presentation/security/security_page.dart';

enum AppRoute {
  home,
  security,
  resume,
  secret,
  resumePage,
  ;

  static AppRoute getCurrentRoute(BuildContext context) {
    final routeName = GoRouterState.of(context).topRoute?.name;
    return switch (routeName) {
      'home' => AppRoute.home,
      'security' => AppRoute.security,
      'resume' => AppRoute.resume,
      'secret' => AppRoute.secret,
      'resume_page' => AppRoute.resumePage,
      _ => throw Exception(
          'This $routeName has not been add as AppRoute enum member'),
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
      path: '/resume',
      name: AppRoute.resumePage.name,
      builder: (context, state) => const ResumePage(),
    ),
    GoRoute(
      path: '/home',
      name: AppRoute.home.name,
      builder: (context, state) => const ResponsiveHome(),
      routes: [
        GoRoute(
            path: 'resume',
            name: AppRoute.resume.name,
            builder: (context, state) => const ResumePdf()),
        GoRoute(
            path: 'security',
            name: AppRoute.security.name,
            builder: (context, state) => const SecurityPage()),
        GoRoute(
            path: 'secret',
            name: AppRoute.secret.name,
            builder: (context, state) => const SecretPage()),
      ],
    ),
  ],
);
