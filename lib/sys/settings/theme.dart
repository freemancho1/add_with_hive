import 'package:add_with_hive/sys/settings/constants.dart';
import 'package:flutter/material.dart';

// textTheme: themeData.textTheme.copyWith(
// titleMedium: lightThemeData.textTheme.titleMedium!.copyWith(
//   fontSize: 50,
// ),

class AppTheme {
  static final ThemeData appTheme = ThemeData(
    /// [primarySwatch]는 Material Design 테마 적용시 사용되는 기본 색상 팔레트,
    primarySwatch: AppConst.appColorScheme,
    // colorSchemeSeed: AppConst.appColorScheme,
    useMaterial3: AppConst.appUseMaterial3,
  );

  static final appDarkTheme = ThemeData(
    colorSchemeSeed: AppConst.appColorScheme,
    useMaterial3: AppConst.appUseMaterial3,
    brightness: Brightness.dark,
  );

  static TextStyle listTileTitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.titleLarge!.copyWith(
      color: Colors.black54,
      overflow: TextOverflow.ellipsis,
    );
  static TextStyle listTileSubtitleStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Colors.black38,
    );
  static TextStyle listLabelStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodySmall!.copyWith(
      color: Colors.black38,
      overflow: TextOverflow.ellipsis,
    );

  static TextStyle snackBaritleStyle(BuildContext context) =>
    Theme.of(context).textTheme.bodyMedium!.copyWith(
      color: Theme.of(context).colorScheme.onPrimary,
      overflow: TextOverflow.ellipsis,
    );

  static Color getPrimaryColor(BuildContext context) =>
    Theme.of(context).colorScheme.primary;
  static Color getBackgroundColor(BuildContext context) =>
    Theme.of(context).colorScheme.background;
  // static const TextStyle listTileSubtitleStyle = TextStyle(
  //   color: Colors.black45,
  //   fontSize: 12,
  // );

}

