import 'package:flutter/material.dart';

class ThoughtSpacing {
  static _Spacing ExtraSmall = const _Spacing(4);
  static _Spacing Small = const _Spacing(8);
  static _Spacing Medium = const _Spacing(12);
  static _Spacing Large = const _Spacing(24);
  static _Spacing ExtraLarge = const _Spacing(48);

  ThoughtSpacing._();
}

class _Spacing {
  final double size;

  const _Spacing(this.size);

  SizedBox get box => SizedBox(width: size, height: size);
}
