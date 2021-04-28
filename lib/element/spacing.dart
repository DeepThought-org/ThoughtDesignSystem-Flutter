import 'package:flutter/material.dart';

class ThoughtSpacing {
  static const _Spacing extraSmall = const _Spacing(4);
  static const _Spacing small = const _Spacing(8);
  static const _Spacing medium = const _Spacing(12);
  static const _Spacing large = const _Spacing(24);
  static const _Spacing extraLarge = const _Spacing(48);

  ThoughtSpacing._();
}

class _Spacing {
  final double size;

  const _Spacing(this.size);

  SizedBox get box => SizedBox(width: size, height: size);
}
