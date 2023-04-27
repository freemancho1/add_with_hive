import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AppConst {
  static const String appName = 'AddWithHiveApp';
  static const Color appColorScheme = Colors.deepOrange;
  static const bool appUseMaterial3 = true;

  static const double _windowWidth = 400;
  static const double _windowHeight = 800;
  static const Size windowSize = Size(_windowWidth, _windowHeight);

  static const debugLogLevel = Level.ALL;
  static const releaseLogLevel = Level.WARNING;

  static const double basePaddingSize = 8.0;
}

