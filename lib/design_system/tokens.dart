import 'package:flutter/material.dart';

abstract final class RelaySpacing {
  static const double xxs = 4;
  static const double xs = 8;
  static const double sm = 12;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;
}

abstract final class RelayRadii {
  static const BorderRadius control = BorderRadius.all(Radius.circular(8));
  static const BorderRadius panel = BorderRadius.all(Radius.circular(12));
  static const BorderRadius sheet = BorderRadius.all(Radius.circular(16));
}

abstract final class RelayMotion {
  static const Duration quick = Duration(milliseconds: 160);
  static const Duration standard = Duration(milliseconds: 260);
  static const Curve emphasized = Curves.easeOutCubic;
}

abstract final class RelayBreakpoints {
  static const double compact = 600;
  static const double expanded = 1024;
}

abstract final class RelayColors {
  static const Color cobalt = Color(0xFF1559C9);
  static const Color critical = Color(0xFFC82C28);
  static const Color high = Color(0xFFA65B00);
  static const Color medium = Color(0xFF1559C9);
  static const Color low = Color(0xFF356B66);
  static const Color success = Color(0xFF087A4E);
  static const Color warning = Color(0xFF9A5700);
}
