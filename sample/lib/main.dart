import 'package:flutter/material.dart';
import 'package:thought_design_system/component/button/thought_button.dart';
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
            ThoughtButton(text: "Hello", onClick: () {}, isEnabled: false,),
          ],
        ),
      ),
    );
  }
}
