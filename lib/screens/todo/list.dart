import 'package:add_with_hive/models/todo.dart';
import 'package:add_with_hive/sys/app_init.dart';
import 'package:add_with_hive/sys/settings/constants.dart';
import 'package:add_with_hive/sys/settings/theme.dart';
import 'package:add_with_hive/sys/utils/datetime.dart';
import 'package:add_with_hive/sys/utils/snack_bar.dart';
import 'package:add_with_hive/view_models/todo_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ListTodoScreen extends StatelessWidget {
  const ListTodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo List')),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppConst.basePaddingSize),
        child: _TodoListBuilder(
          todos: context.read<TodoBoxViewModel>().getTodos(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go('/new'),
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
    return todos.isEmpty
      ? const Center(child: Text(AppConst.textTodoNothing),)
      : ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          appLog.fine(todo.toString());
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppConst.basePaddingSize),
            child: ListTile(
              /// textTheme.titleMedium
              title: Text(
                todo.title,
                style: AppTheme.listTileTitleStyle(context),
                maxLines: 1,
              ),
              /// textTheme.bodyMedium
              subtitle: _subTitle(todo, context),
              style: ListTileStyle.list,
              onTap: () {
                appLog.info('${todo.title} 클릭됨!');
                showSnackBar(
                  '${todo.title} 클릭됨!',
                  backgroundColor: AppTheme.getPrimaryColor(context),
                  duration: const Duration(seconds: 2),
                );
              },
            ),
          );
        },
      );
  }

  Widget _subTitle(Todo todo, BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (todo.subTitle.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(left: AppConst.basePaddingSize),
          child: Text(
            todo.subTitle,
            maxLines: null,
            style: AppTheme.listTileSubtitleStyle(context),
          ),
        ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            (todo.deadline == null)
              ? '': dateToString(todo.deadline!),
            maxLines: 1,
            style: AppTheme.listLabelStyle(context),
          ),
          Text(
            '2023-12-30',
            style: AppTheme.listLabelStyle(context),
          ),
        ],
      )
    ],
  );
}
