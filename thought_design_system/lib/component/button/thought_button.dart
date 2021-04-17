import 'package:flutter/material.dart';
import 'package:thought_design_system/component/button/thought_button_style.dart';
import 'package:thought_design_system/element/color.dart';
import 'package:thought_design_system/element/spacing.dart';
import 'package:thought_design_system/element/typography.dart';

class ThoughtButton extends StatelessWidget {
  final ThoughtButtonStyle style;

  final String text;
  final VoidCallback onClick;
  final bool isEnabled;

  ThoughtButton({
    Key? key,
    this.style: ThoughtButtonStyle.Primary,
    this.isEnabled: true,
    required this.text,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (style) {
      case ThoughtButtonStyle.Primary:
        return _ThoughtPrimaryButton(this);
      case ThoughtButtonStyle.FullScreen:
        return _ThoughtFullscreenButton(this);
    }
  }

  Color get textColor =>
      isEnabled ? ThoughtColor.OnPrimary : ThoughtColor.Grey400;

  Color get backgroundColor =>
      isEnabled ? ThoughtColor.PrimaryVariant : ThoughtColor.Yellow100;

  void onClickButton() {
    isEnabled ? onClick() : null;
  }
}

class _ThoughtPrimaryButton extends StatelessWidget {
  final ThoughtButton property;

  _ThoughtPrimaryButton(this.property);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ThoughtSpacing.Large.size),
      child: _buildButton(),
    );
  }

  _buildButton() => ElevatedButton(
        child: Padding(
          child: Text(
            property.text,
            style: ThoughtTypography.Body1.bold.copyWith(
              color: property.textColor,
            ),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        onPressed: property.onClickButton,
        style: ButtonStyle(
            elevation:
                MaterialStateProperty.all(property.isEnabled ? 4.0 : 0.0),
            backgroundColor:
                MaterialStateProperty.all(property.backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ))),
      );
}

class _ThoughtFullscreenButton extends StatelessWidget {
  final ThoughtButton property;

  _ThoughtFullscreenButton(this.property);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: _buildButton(),
    );
  }

  _buildButton() => ElevatedButton(
        onPressed: property.onClickButton,
        child: Padding(
          child: Text(
            property.text,
            style: ThoughtTypography.Body1.bold
                .copyWith(color: property.textColor),
          ),
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            backgroundColor:
                MaterialStateProperty.all(property.backgroundColor),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ))),
      );
}
