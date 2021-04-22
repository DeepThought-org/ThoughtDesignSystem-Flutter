import 'package:flutter/material.dart';

abstract class ThoughtButtonStyle extends StatelessWidget {
  const ThoughtButtonStyle({
    Key? key,
    required this.text,
    required this.onClick,
    required this.isEnabled,
  }) : super(key: key);

  final String text;
  final VoidCallback onClick;
  final bool isEnabled;
}

class ThoughtButton extends ThoughtButtonStyle {
  const ThoughtButton({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool isEnabled = true,
  }) : super(
      key: key,
      text: text,
      onClick: onClick,
      isEnabled: isEnabled
  );

  factory ThoughtButton.fullScreen({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool? isEnabled
  }) = _PrimaryThoughtButton;

  @override
  Widget build(BuildContext context) {

  }
}

class _PrimaryThoughtButton extends ThoughtButton {

  _PrimaryThoughtButton({
    Key? key,
    required String text,
    required VoidCallback onClick,
    bool? isEnabled
  }) : super(
      key: key,
      text: text,
      onClick: onClick,
      isEnabled: isEnabled ?? true
  )

  @override
  Widget build(BuildContext context) {

  }
}

