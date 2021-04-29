import 'package:flutter/material.dart';
import 'package:thought_design_system/element/spacing.dart';
import 'package:thought_design_system/element/typography.dart';

@immutable
abstract class _ThoughtTextFieldStyle extends StatelessWidget {
  _ThoughtTextFieldStyle({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.unit,
    required this.limit,
    required this.currentLength,
    required this.errorText,
    required this.lines,
  }) : super(key: key);

  final String hint;
  final Function(String) onChanged;
  final String? unit;
  final int? limit;
  final int? currentLength;
  final String? errorText;
  final int lines;

  String? get counterText =>
      limit != null ? "${currentLength ?? 0}/$limit" : " ";

  EdgeInsets get textFieldPadding => EdgeInsets.symmetric(
        horizontal: ThoughtSpacing.large.size,
        vertical: ThoughtSpacing.medium.size,
      );

  _textStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .headline6!
      .regular
      .copyWith(color: Theme.of(context).colorScheme.onBackground);

  _hintStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .headline6!
      .regular
      .copyWith(color: Colors.grey[500]!);

  _counterStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: Colors.grey[500]!, height: 0.8);

  _errorStyle(BuildContext context) => Theme.of(context)
      .textTheme
      .caption!
      .copyWith(color: Theme.of(context).colorScheme.error, height: 0.8);
}

class ThoughtTextField extends _ThoughtTextFieldStyle {
  ThoughtTextField({
    Key? key,
    required String hint,
    required Function(String) onChanged,
    String? unit,
    int? limit,
    int? currentLength,
    String? errorText,
    int? lines,
  }) : super(
          key: key,
          hint: hint,
          onChanged: onChanged,
          unit: unit,
          limit: limit,
          currentLength: currentLength,
          errorText: errorText,
          lines: lines ?? 1,
        );

  factory ThoughtTextField.outline({
    Key? key,
    required String hint,
    required Function(String) onChanged,
    required int lines,
    int? limit,
    int? currentLength,
    String? errorText,
  }) = _OutlineThoughtTextField;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: textFieldPadding,
      child: TextField(
        maxLength: limit,
        style: _textStyle(context),
        onChanged: onChanged,
        minLines: lines,
        maxLines: lines,
        decoration: InputDecoration(
          isDense: true,
          suffixIcon: _buildUnit(context),
          suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
          hintText: hint,
          hintStyle: _hintStyle(context),
          errorText: errorText,
          errorStyle: _errorStyle(context),
          counterText: counterText,
          counterStyle: _counterStyle(context),
          border: _buildUnderlineBorder(Colors.grey[400]!),
          focusedBorder: _buildUnderlineBorder(
              Theme.of(context).colorScheme.primaryVariant),
          focusedErrorBorder:
              _buildUnderlineBorder(Theme.of(context).colorScheme.error),
          errorBorder:
              _buildUnderlineBorder(Theme.of(context).colorScheme.error),
          contentPadding:
              EdgeInsets.only(bottom: ThoughtSpacing.extraSmall.size),
        ),
      ),
    );
  }

  _buildUnit(BuildContext context) => unit != null
      ? Padding(
          padding: EdgeInsets.only(
              right: 2.0, bottom: ThoughtSpacing.extraSmall.size),
          child: Text(
            unit!,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .regular
                .copyWith(color: Colors.grey[900]!),
          ),
        )
      : SizedBox.shrink();

  _buildUnderlineBorder(Color color) =>
      UnderlineInputBorder(borderSide: BorderSide(color: color));
}

class _OutlineThoughtTextField extends ThoughtTextField {
  _OutlineThoughtTextField({
    Key? key,
    required String hint,
    required Function(String) onChanged,
    required int lines,
    int? limit,
    int? currentLength,
    String? errorText,
  }) : super(
          key: key,
          hint: hint,
          onChanged: onChanged,
          limit: limit,
          currentLength: currentLength,
          errorText: errorText,
          lines: lines,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: textFieldPadding,
      child: TextField(
        maxLength: limit,
        style: _textStyle(context),
        onChanged: onChanged,
        maxLines: lines,
        minLines: lines,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: _hintStyle(context),
          errorText: errorText,
          errorStyle: _errorStyle(context),
          counterText: counterText,
          counterStyle: _counterStyle(context),
          border: _buildOutlinedBorder(Colors.grey[400]!),
          focusedBorder: _buildOutlinedBorder(
              Theme.of(context).colorScheme.primaryVariant),
          focusedErrorBorder:
              _buildOutlinedBorder(Theme.of(context).colorScheme.error),
          errorBorder:
              _buildOutlinedBorder(Theme.of(context).colorScheme.error),
          contentPadding: EdgeInsets.only(top: 13, bottom: 11, left: 13),
        ),
      ),
    );
  }

  _buildOutlinedBorder(Color color) => OutlineInputBorder(
        borderSide: BorderSide(color: color),
        borderRadius: BorderRadius.circular(4),
      );
}
