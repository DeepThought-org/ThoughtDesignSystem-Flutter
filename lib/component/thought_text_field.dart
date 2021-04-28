import 'package:flutter/material.dart';
import 'package:thought_design_system/element/spacing.dart';
import 'package:thought_design_system/element/typography.dart';

abstract class _ThoughtTextFieldStyle extends StatelessWidget {
  _ThoughtTextFieldStyle({
    Key? key,
    required this.hint,
    required this.onChanged,
    required this.unit,
    required this.limit,
    required this.currentLength,
    required this.errorText,
  }) : super(key: key);

  final String hint;
  final Function(String) onChanged;
  final String? unit;
  final int? limit;
  final int? currentLength;
  final String? errorText;

  String? get counterText =>
      limit != null ? "${currentLength ?? 0}/$limit" : null;

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
  }) : super(
          key: key,
          hint: hint,
          onChanged: onChanged,
          unit: unit,
          limit: limit,
          currentLength: currentLength,
          errorText: errorText,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ThoughtSpacing.large.size),
      child: TextField(
        maxLength: limit,
        style: _textStyle(context),
        onChanged: onChanged,
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
