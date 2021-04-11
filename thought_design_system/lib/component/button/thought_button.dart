library desgin_system_flutter;

import 'package:flutter/material.dart';
import 'package:thought_design_system/component/button/thought_button_style.dart';
import 'package:thought_design_system/theme/color.dart';
import 'package:thought_design_system/theme/spacing.dart';
import 'package:thought_design_system/theme/typography.dart';

class ThoughtButton extends StatelessWidget {
  final String text;
  final Function onClick;
  final bool isEnabled;
  final ThoughtButtonStyle buttonStyle;

  ThoughtButton({
    required this.text,
    required this.onClick,
    this.isEnabled: true,
    this.buttonStyle: ThoughtButtonStyle.Primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: ThoughtSpacing.Large.size),
      child: _button(),
    );
  }

  _button() => ElevatedButton(
        child: Padding(
          child: Text(
            text,
            style: ThoughtTypography.Body1.bold.copyWith(
              color: isEnabled ? ThoughtColor.OnPrimary : ThoughtColor.Grey400,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: () {
          isEnabled ? onClick() : null;
        },
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(isEnabled ? 4.0 : 0.0),
          backgroundColor: MaterialStateProperty.all(
            isEnabled ? ThoughtColor.PrimaryVariant : ThoughtColor.Yellow100,
          ),
        ),
      );
}
