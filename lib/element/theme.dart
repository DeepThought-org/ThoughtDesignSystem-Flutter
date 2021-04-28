import 'package:flutter/material.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/typography.dart';

class ThoughtApp extends StatelessWidget {
  ThoughtApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: ThoughtTextTheme,
        colorScheme: ThoughtLightColorScheme,
      ),
      home: child,
    );
  }
}
