import 'package:flutter/material.dart';
import 'package:thought_design_system/component/textField/thought_text_field.dart';
import 'package:thought_design_system/component/toolbar/thought_toolbar.dart';
import 'package:thought_design_system/component/toolbar/thought_toolbar_style.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/spacing.dart';

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
          scaffoldBackgroundColor: ThoughtColor.Background,
        ),
        home: Scaffold(
          appBar: EmptyToolbar(),
          body: Column(
            children: [
              ThoughtToolbar(
                title: "완전 중요한 헤더\n입니다",
                style: ThoughtToolbarStyle.Big,
              ),
              ThoughtTextField(
                hint: "이름",
                onChanged: (text) {},
              ),
              ThoughtSpacing.Large.box,
              ThoughtTextField(
                hint: "비밀번호",
                onChanged: (text) {},
              )
            ],
          ),
        ));
  }
}
