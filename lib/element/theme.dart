import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/typography.dart';

class ThoughtApp extends StatelessWidget {
  ThoughtApp({
    Key? key,
    required this.routerDelegate,
  }) : super(key: key);

  final BeamerDelegate<BeamState> routerDelegate;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher:
          BeamerBackButtonDispatcher(delegate: routerDelegate),
      theme: ThemeData(
        textTheme: ThoughtTextTheme,
        colorScheme: ThoughtLightColorScheme,
      ),
    );
  }
}
