import 'package:add_with_hive/settings/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: HiveCfg.tableIdTodo)
class Todo {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime? deadline;

  @HiveField(2)
  bool isCompleted = false;

  @HiveField(3)
  DateTime? completedAt;

  @HiveField(4)
  List<Todo> todos = [];

  Todo(this.title);

  @override
  String toString() {
    return 'Todo('
      'title: $title, '
      'dead line: $deadline, '
      'isCompleted: $isCompleted, '
      'todos length: ${todos.length}'
    ')';
  }
}
