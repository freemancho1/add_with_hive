import 'package:add_with_hive/models/todo.dart';
import 'package:add_with_hive/settings/app_init.dart';
import 'package:add_with_hive/settings/constants.dart';
import 'package:add_with_hive/settings/theme.dart';
import 'package:add_with_hive/view_models/todo_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final todoModel = context.watch<TodoBoxViewModel>();
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: _TodoListBuilder(todos: todoModel.getTodos(),),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              String? title;
              // DateTime? deadline;
              return AlertDialog(
                title: const Text('Add todo'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title'
                      ),
                      onChanged: (value) => title = value,
                      // onEditingComplete: () => deadline = DateTime.now(),
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    child: const Text('Cancel'),
                    onPressed: () => context.pop(),
                  ),
                  TextButton(
                    child: const Text('Add'),
                    onPressed: () {
                      if (title!.isNotEmpty) {
                        todoModel.add(Todo(title!)..deadline=DateTime.now());
                        context.pop();
                      }
                    },
                  )
                ],
              );
            }
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _TodoListBuilder extends StatelessWidget {
  final List<Todo> todos;
  const _TodoListBuilder({required this.todos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        appLog.fine(todo.toString());
        return Padding(
          padding: const EdgeInsets.all(AppConst.basePaddingSize),
          child: ListTile(
            /// textTheme.titleMedium
            title: Text(todo.title),
            /// textTheme.bodyMedium
            subtitle: Text(
              (todo.deadline ?? '').toString(),
              style: AppTheme.listTileSubtitleStyle,
            ),
            style: ListTileStyle.list,
          ),
        );
      },
    );
  }
}
