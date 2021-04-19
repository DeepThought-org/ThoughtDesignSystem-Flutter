import 'package:flutter/material.dart';

class ThoughtSpacing {
  static const _Spacing ExtraSmall = const _Spacing(4);
  static const _Spacing Small = const _Spacing(8);
  static const _Spacing Medium = const _Spacing(12);
  static const _Spacing Large = const _Spacing(24);
  static const _Spacing ExtraLarge = const _Spacing(48);

  ThoughtSpacing._();
}

class _Spacing {
  final double size;

  const _Spacing(this.size);

  SizedBox get box => SizedBox(width: size, height: size);
}
