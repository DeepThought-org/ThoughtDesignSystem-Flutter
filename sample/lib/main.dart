import 'package:flutter/material.dart';
import 'package:thought_design_system/component/button/thought_button.dart';
import 'package:thought_design_system/component/toolbar/thought_toolbar.dart';
import 'package:thought_design_system/element/color.dart';
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
            backgroundColor: ThoughtColor.Background),
        home: Scaffold(
          appBar: EmptyToolbar(),
          body: Column(
            children: [
              ThoughtToolbar(
                navigationIcon: ThoughtIcon.back,
                actionIcon: ThoughtIcon.share,
                title: "Hel",
              ),
            ],
          ),
        ));
  }
}
