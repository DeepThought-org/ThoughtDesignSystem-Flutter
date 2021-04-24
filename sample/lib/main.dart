import 'package:flutter/material.dart';
import 'package:thought_design_system/component/thought_button.dart';
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
      child: Scaffold(
        appBar: AppBar(title: Text("Hello")),
        body: Column(
          children: [
            ThoughtToolbar(
              title: "호빵",
              navigationIcon: ThoughtIcon.back,
              actionIcon: ThoughtIcon.share,
            ),
            ThoughtButton(
              text: "Hello",
              onClick: () {},
              isEnabled: false,
            ),
            ThoughtButton.fullScreen(
              text: "Helo",
              onClick: () {},
              isEnabled: false,
            )
          ],
        ),
      ),
    );
  }
}
