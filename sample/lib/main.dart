import 'package:flutter/material.dart';
import 'package:thought_design_system/component/button/thought_button.dart';
import 'package:thought_design_system/component/button/thought_button_style.dart';

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
          appBar: AppBar(),
          body: Column(
            children: [
              ThoughtButton(
                text: "Hello",
                onClick: () {},
                isEnabled: true,
                style: ThoughtButtonStyle.Primary,
              ),
            ],
          ),
        ));
  }
}
