import 'package:flutter/material.dart';
import 'package:thought_design_system/component/thought_text_field.dart';
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
            ThoughtTextField(
              hint: "Hello",
              onChanged: (text) {},
              unit: "살",
              errorText: "Hello",
              limit: 3,
              currentLength: 1,
            ),
            ThoughtTextField(
              hint: "Hello",
              onChanged: (text) {},
              unit: "살",
              limit: 3,
              currentLength: 1,
            ),
          ],
        ),
      ),
    );
  }
}
