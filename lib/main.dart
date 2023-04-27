import 'package:add_with_hive/settings/router.dart';
import 'package:add_with_hive/settings/app_init.dart';
import 'package:add_with_hive/settings/theme.dart';
import 'package:add_with_hive/view_models/todo_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

void main() async {
  await appInit();
  runApp(const AppMain());
}

class AppMain extends StatefulWidget {
  const AppMain({super.key});
  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoBoxViewModel(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Todo List',
        themeMode: _themeMode,
        // themeMode: AppThemeMode.useLightMode,
        theme: AppTheme.appTheme,
        darkTheme: AppTheme.appDarkTheme,
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
      ),
    );
  }

  late ThemeMode _themeMode;

  void _setTheme() {
    setState(() {
      _themeMode =
      SchedulerBinding.instance.window.platformBrightness == Brightness.light
          ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  void initState() {
    super.initState();
    _setTheme();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      SchedulerBinding.instance.window.onPlatformBrightnessChanged = () {
        _setTheme();
      };
    });
  }
}