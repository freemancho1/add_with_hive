import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

class AppConst {
  static const String appName = 'AddWithHiveApp';
  static const MaterialColor appColorScheme = Colors.deepOrange;
  static const bool appUseMaterial3 = false;

  static const double _windowWidth = 400;
  static const double _windowHeight = 800;
  static const Size windowSize = Size(_windowWidth, _windowHeight);

  static const debugLogLevel = Level.ALL;
  static const releaseLogLevel = Level.WARNING;

  static const double basePaddingSize = 8.0;
  static const Widget gapHightSmall = SizedBox(height: basePaddingSize,);

  /// NewTodoScreen
  static const Widget appBarNewTodo = Text('할일 등록');
  static const String textTodoNothing = '할일이 없습니다.';
  static const String textNewTodoTitle = '할일';
  static const String textNewTodoSubTitle = '상세 내용';
  static const String textNewTodoDeadline = '기한';
  static const Widget widgetSave = Text(
    textSave, style: TextStyle(color: Colors.white),);

  static const String textSave = '저장';
}

