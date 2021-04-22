import 'package:flutter/material.dart';

const LightWeight = FontWeight.w300;
const MediumWeight = FontWeight.w500;

const ThoughtTextTheme = const TextTheme(
  headline1: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: LightWeight,
    fontSize: 96,
  ),
  headline2: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: MediumWeight,
    fontSize: 60,
  ),
  headline3: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: FontWeight.bold,
    fontSize: 48,
  ),
  headline4: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: MediumWeight,
    fontSize: 34,
  ),
  headline5: TextStyle(
    fontFamily: 'Spoqa',
    fontSize: 24,
  ),
  headline6: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: MediumWeight,
    fontSize: 20,
  ),
  button: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: FontWeight.bold,
    fontSize: 16,
  ),
  bodyText1: TextStyle(
    fontFamily: 'Spoqa',
    fontSize: 16,
  ),
  bodyText2: TextStyle(
    fontFamily: 'Spoqa',
    fontSize: 14,
  ),
  caption: TextStyle(
    fontFamily: 'Spoqa',
    fontSize: 12,
  ),
  overline: TextStyle(
    fontFamily: 'Spoqa',
    fontWeight: FontWeight.bold,
    fontSize: 10,
  ),
);

extension ThoughtTypographyExt on TextStyle {
  TextStyle get light => copyWith(fontWeight: LightWeight);

  TextStyle get medium => copyWith(fontWeight: MediumWeight);

  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
}
