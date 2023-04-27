import 'package:add_with_hive/settings/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppTheme {
  static final ThemeData lightThemeData = ThemeData.light();
  static final ThemeData darkThemeData = ThemeData.dark();
  static late ThemeData currThemeData;

  static final appTheme = ThemeData(
    /// [colorSchemeSeed]는 App 전체 색상에 영향을 주며,
    /// [colorScheme]는 특정 구성요소에 영향을 줌.
    primarySwatch: AppConst.appColorScheme,
    useMaterial3: AppConst.appUseMaterial3,
    textTheme: lightThemeData.textTheme.copyWith(
      // titleMedium: lightThemeData.textTheme.titleMedium!.copyWith(
      //   fontSize: 50,
      // ),
      /// 특정 속성의 값만 변경하고 할 경우
      bodyMedium: lightThemeData.textTheme.bodyMedium!.copyWith(
          fontSize: 12,
          color: lightThemeData.colorScheme.error
        // color: lightThemeData.colorScheme.surface
      ),
    ),
    brightness: Brightness.light,
  );

  static final appDarkTheme = ThemeData(
    colorSchemeSeed: AppConst.appColorScheme,
    useMaterial3: AppConst.appUseMaterial3,
    brightness: Brightness.dark,
  );

  /// 특정 스타일 적용(ThemeData를 안쓸 경우)
  static const TextStyle listTileSubtitleStyleSample = TextStyle(
    color: Colors.white,
  );

  /// ThemeData가 light와 dark 모드로 되어 있어 구분해줘야 함)
  static TextStyle get listTileSubtitleStyle {
    setThemeMode();
    return TextStyle(
      color: currThemeData.colorScheme.secondary
    );
  }

  static void setThemeMode() => currThemeData =
    SchedulerBinding.instance.window.platformBrightness == Brightness.light
      ? lightThemeData : darkThemeData;
}
