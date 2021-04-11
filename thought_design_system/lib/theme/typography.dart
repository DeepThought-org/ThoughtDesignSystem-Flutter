library desgin_system_flutter;

import 'package:flutter/material.dart';
import 'package:thought_design_system/theme/color.dart';

class ThoughtTypography {
  static const H1 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 48,
    fontFamily: 'Spoqa',
  );

  static const H2 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 34,
    fontFamily: 'Spoqa',
  );

  static const Sub1 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 24,
    fontFamily: 'Spoqa',
  );

  static const Sub2 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 20,
    fontFamily: 'Spoqa',
  );

  static const Body1 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 16,
    fontFamily: 'Spoqa',
  );

  static const Body2 = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 14,
    fontFamily: 'Spoqa',
  );

  static const Caption = const TextStyle(
    color: ThoughtColor.OnBackground,
    fontSize: 12,
    fontFamily: 'Spoqa',
  );

  ThoughtTypography._();
}

extension ThoughtTypographyExt on TextStyle {
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
