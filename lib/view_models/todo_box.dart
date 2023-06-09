import 'package:add_with_hive/models/todo.dart';
import 'package:add_with_hive/sys/utils/hive.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoBoxViewModel extends ChangeNotifier {

  final Box<Todo> _todoBox = Hive.box<Todo>(HiveCfg.tableNameTodo);

  void add(Todo todo) => _add(todo);

  Future<void> _add(Todo todo) async {
    await _todoBox.add(todo);
    notifyListeners();
  }

  Future<void> remove(Todo todo) async {
    await _todoBox.delete(todo);
    notifyListeners();
  }

  List<Todo> getTodos() {
    return _todoBox.values.toList().cast<Todo>();
  }

}