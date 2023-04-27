import 'package:add_with_hive/models/todo.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'app_init.dart';

class HiveCfg {
  static const tableNameTodo = 'todos';
  static const tableIdTodo = 0;
}

Future<void> hiveInit() async {

  await Hive.initFlutter();
  final appDocumentDir =
    await path_provider.getApplicationDocumentsDirectory();
  appLog.info('AppDocumentDir(HiveDir): [${appDocumentDir.path}]');

  Hive.init(appDocumentDir.path);

  Hive.registerAdapter(TodoAdapter());

  await Hive.openBox<Todo>(HiveCfg.tableNameTodo);
  appLog.info('Done');

}