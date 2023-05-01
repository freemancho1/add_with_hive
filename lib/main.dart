import 'package:add_with_hive/sys/settings/localizations.dart';
import 'package:add_with_hive/sys/settings/router.dart';
import 'package:add_with_hive/sys/app_init.dart';
import 'package:add_with_hive/sys/settings/theme.dart';
import 'package:add_with_hive/sys/utils/snack_bar.dart';
import 'package:add_with_hive/view_models/todo_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  await appInit();
  runApp(const AppMain());
}

class AppMain extends StatelessWidget {
  const AppMain({super.key});

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
        theme: AppTheme.appTheme,
        routerConfig: appRouter,
        /// scaffoldMessengerKey는 [sys/utils/snack_bar.dart]에서 정의됨.
        scaffoldMessengerKey: scaffoldMessengerKey,
        localizationsDelegates: localizationsDelegates,
        supportedLocales: supportedLocales,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
