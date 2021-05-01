import 'package:flutter/widgets.dart';

class ThoughtIcon {
  ThoughtIcon._();

  static const _kFontFam = 'ThoughtIcon';
  static const String? _kFontPkg = "thought_design_system";

  static const IconData share =
      IconData(0xe800, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData back =
      IconData(0xe801, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData close =
      IconData(0xe802, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}
