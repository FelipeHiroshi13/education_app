import 'package:education_app/core/commom/presentation/screens/page_under_construction.dart';
import 'package:education_app/src/on_boarding/presentation/on_boarding_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case OnBoardingScreen.routeName:
      return _pageBuilder((_) => const OnBoardingScreen(), settings: settings);
    default:
      return _pageBuilder(
        (_) => const PageUnderConstructions(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
