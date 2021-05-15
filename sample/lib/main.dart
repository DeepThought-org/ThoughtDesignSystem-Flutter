import 'package:flutter/material.dart';
import 'package:thought_design_system/component/thought_bottom_navigation.dart';
import 'package:thought_design_system/component/thought_scaffold.dart';
import 'package:thought_design_system/component/thought_toolbar.dart';
import 'package:thought_design_system/element/icon.dart';
import 'package:thought_design_system/element/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThoughtApp(
      child: ThoughtBottomNavigation(
        items: [
          ThoughtBottomNavigationItem(
              name: "Hello",
              icon: Icons.ac_unit,
              view: ThoughtScaffold(
                body: Column(
                  children: [ThoughtToolbar.big(title: "Hello")],
                ),
              )),
          ThoughtBottomNavigationItem(
            name: "Hello",
            icon: ThoughtIcon.back,
            view: Scaffold(
              appBar: AppBar(title: Text("Hello12323")),
              body: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
