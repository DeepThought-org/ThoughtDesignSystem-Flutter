import 'package:flutter/material.dart';
import 'package:thought_design_system/component/textField/thought_text_field_style.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/typography.dart';

class ThoughtTextField extends StatelessWidget {
  final ThoughtTextFieldStyle style;

  final String hint;
  final Function(String) onChanged;
  final bool isSensitive;
  final String? unit;
  final String? limit;
  final String? errorText;

  ThoughtTextField({
    Key? key,
    this.style: ThoughtTextFieldStyle.Primary,
    required this.hint,
    required this.onChanged,
    this.isSensitive: false,
    this.unit,
    this.limit,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ThoughtTextFieldStyle.Primary:
        return _PrimaryThoughtTextField(this);
      case ThoughtTextFieldStyle.Outline:
        return _OutlineThoughtTextField(this);
    }
  }
}

class _PrimaryThoughtTextField extends StatefulWidget {
  final ThoughtTextField property;

  _PrimaryThoughtTextField(this.property);

  @override
  _PrimaryThoughtTextFieldState createState() =>
      _PrimaryThoughtTextFieldState();
}

class _PrimaryThoughtTextFieldState extends State<_PrimaryThoughtTextField>
    with TickerProviderStateMixin {
  late final AnimationController animation;
  late final Animation<TextStyle> fontSize;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    fontSize = Tween<TextStyle>(
            begin: ThoughtTypography.Caption.bold
                .copyWith(color: ThoughtColor.PrimaryVariant),
            end: ThoughtTypography.Sub2.copyWith(color: ThoughtColor.Grey500))
        .animate(CurvedAnimation(
      parent: animation,
      curve: Interval(
        0.0,
        0.100,
        curve: Curves.ease,
      ),
    ));
    animation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, _) {
          return Text(
            "Hello",
            style: fontSize.value,
          );
        },
      ),
    );
  }
}

class _OutlineThoughtTextField extends StatelessWidget {
  final ThoughtTextField property;

  _OutlineThoughtTextField(this.property);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
