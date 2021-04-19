import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ThoughtIcon {
  static const String _package = "thought_design_system";

  static Widget get back =>
      SvgPicture.asset("assets/icon/ic_back.svg", package: _package);

  static Widget get close =>
      SvgPicture.asset("assets/icon/ic_close.svg", package: _package);

  static Widget get share =>
      SvgPicture.asset("assets/icon/ic_share.svg", package: _package);

  ThoughtIcon._();
}
