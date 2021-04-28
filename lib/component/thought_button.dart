import 'package:flutter/material.dart';
import 'package:thought_design_system/element/spacing.dart';

abstract class _ThoughtButtonStyle extends StatelessWidget {
  const _ThoughtButtonStyle({
    Key? key,
    required this.text,
    required this.onClick,
    required this.isEnabled,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;
  final bool isEnabled;

  Color getBackgroundColor(BuildContext context) {
    return isEnabled
        ? Theme.of(context).colorScheme.primary
        : Colors.grey[400]!;
  }

  TextStyle getTextStyle(BuildContext context) {
    final textColor =
        isEnabled ? Theme.of(context).colorScheme.onPrimary : Colors.grey[100]!;
    return Theme.of(context).textTheme.button!.copyWith(color: textColor);
  }

  VoidCallback? click() {
    return isEnabled ? onClick : null;
  }
}

class ThoughtButton extends _ThoughtButtonStyle {
  const ThoughtButton({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool? isEnabled,
  }) : super(
          key: key,
          text: text,
          onClick: onClick,
          isEnabled: isEnabled ?? true,
        );

  factory ThoughtButton.fullScreen({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool? isEnabled,
  }) = _PrimaryThoughtButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ThoughtSpacing.large.size),
      child: _buildButton(context),
    );
  }

  _buildButton(BuildContext context) => ElevatedButton(
        onPressed: click(),
        style: _buildButtonStyle(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 14),
          child: Text(
            text,
            style: getTextStyle(context),
          ),
        ),
      );

  _buildButtonStyle(BuildContext context) => ButtonStyle(
        elevation: MaterialStateProperty.all(isEnabled ? 4 : 0),
        backgroundColor:
            MaterialStateProperty.all(getBackgroundColor(context)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
      );
}

class _PrimaryThoughtButton extends ThoughtButton {
  _PrimaryThoughtButton({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool? isEnabled,
  }) : super(
          key: key,
          text: text,
          onClick: onClick,
          isEnabled: isEnabled,
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: _buildButton(context),
    );
  }

  @override
  _buildButton(BuildContext context) => ElevatedButton(
        onPressed: click(),
        style: _buildButtonStyle(context),
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 14),
          child: Text(
            text,
            style: getTextStyle(context),
          ),
        ),
      );

  @override
  _buildButtonStyle(BuildContext context) => ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor:
            MaterialStateProperty.all(getBackgroundColor(context)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
      );
}
