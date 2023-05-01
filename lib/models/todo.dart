import 'package:add_with_hive/sys/utils//hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'todo.g.dart';

@HiveType(typeId: HiveCfg.tableIdTodo)
class Todo {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subTitle = '';

  @HiveField(2)
  DateTime? deadline;

  @HiveField(3)
  bool isCompleted = false;

  @HiveField(4)
  DateTime? completedAt;

  @HiveField(5)
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
