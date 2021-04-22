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
        : Colors.grey[300]!;
  }

  TextStyle getTextStyle(BuildContext context) {
    final textColor =
        isEnabled ? Theme.of(context).colorScheme.onPrimary : Colors.grey[100]!;
    return Theme.of(context).textTheme.button!.copyWith(color: textColor);
  }

  void click() {
    if (isEnabled) {
      onClick();
    }
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

  factory ThoughtButton.fullScreen(
      {Key? key,
      required String text,
      required VoidCallback onClick,
      bool? isEnabled}) = _PrimaryThoughtButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: ThoughtSpacing.Large.size),
      color: super.getBackgroundColor(context),
      child: _buildButton(context),
    );
  }

  _buildButton(BuildContext context) => ElevatedButton(
        onPressed: super.click,
        child: Text(
          super.text,
          style: super.getTextStyle(context),
        ),
      );
}

class _PrimaryThoughtButton extends ThoughtButton {
  _PrimaryThoughtButton(
      {Key? key,
      required String text,
      required VoidCallback onClick,
      bool? isEnabled})
      : super(key: key, text: text, onClick: onClick, isEnabled: isEnabled);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
