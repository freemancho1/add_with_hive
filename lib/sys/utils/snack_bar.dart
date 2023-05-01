import 'package:add_with_hive/sys/settings/theme.dart';
import 'package:flutter/material.dart';

/// 이 key를 Material.router 또는 MaterialApp에 등록해야 함.
final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
  GlobalKey(debugLabel: 'scaffoldMessengerKey');

void showSnackBar(String message,{
  TextAlign? textAlign,
  Color? backgroundColor,
  Duration duration = const Duration(milliseconds: 4000),
}) {
  final messenger = scaffoldMessengerKey.currentState;
  messenger?.showSnackBar(SnackBar(
    content: Text(
      message,
      textAlign: textAlign ?? TextAlign.start,
      style: AppTheme.snackBaritleStyle(messenger.context),
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  ));
}