import 'package:flutter/material.dart';
import 'package:thought_design_system/element/icon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                ThoughtIcon.close
              ],
            ),
          ),
        ));
  }
}
