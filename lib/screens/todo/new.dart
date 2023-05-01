import 'package:add_with_hive/models/todo.dart';
import 'package:add_with_hive/sys/app_init.dart';
import 'package:add_with_hive/sys/settings/constants.dart';
import 'package:add_with_hive/sys/utils/datetime.dart';
import 'package:add_with_hive/view_models/todo_box.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NewTodoScreen extends StatefulWidget {
  const NewTodoScreen({Key? key}) : super(key: key);

  @override
  State<NewTodoScreen> createState() => _NewTodoScreenState();
}

class _NewTodoScreenState extends State<NewTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  final _textController = TextEditingController();

  String title = '';
  String subTitle = '';
  DateTime? deadline;

  @override
  void initState() {
    super.initState();
    _textController.text = dateToString(DateTime.now());
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppConst.appBarNewTodo,
        actions: [
          TextButton(
            onPressed: () {
              if (title.isNotEmpty) {
                context.read<TodoBoxViewModel>().add(
                  Todo(title)
                    ..subTitle = subTitle
                    ..deadline = deadline
                );
              }
              context.pop();
            },
            child: AppConst.widgetSave
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConst.basePaddingSize),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                key: const ValueKey(0),
                /// 최대줄을 선택하지 않으면, 위젯의 끝으로 이동했을 때 자동 줄바꿈.
                maxLines: null,
                onSaved: (value) => title = value!,
                onChanged: (value) => title = value,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.menu_open,
                  ),
                  labelText: AppConst.textNewTodoTitle,
                ),
                textInputAction: TextInputAction.next,
              ),
              AppConst.gapHightSmall,
              TextFormField(
                key: const ValueKey(1),
                /// 최대줄을 선택하지 않으면, 위젯의 끝으로 이동했을 때 자동 줄바꿈.
                maxLines: null,
                onSaved: (value) => subTitle = value!,
                onChanged: (value) => subTitle = value,
                decoration: const InputDecoration(
                  prefixIcon: Icon(
                    Icons.edit_note,
                  ),
                  labelText: AppConst.textNewTodoSubTitle,
                ),
                textInputAction: TextInputAction.next,
              ),
              AppConst.gapHightSmall,
              TextFormField(
                key: const ValueKey(2),
                controller: _textController,
                maxLines: 1,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.calendar_month),
                  labelText: AppConst.textNewTodoDeadline,
                  suffixIcon: IconButton(
                    // padding: const EdgeInsets.all(0),
                    focusColor: Colors.black54,
                    onPressed: () => setState(() {
                      _textController.text = '';
                      deadline = null;
                    }),
                    icon: const Icon(Icons.close),
                    // iconSize: 16,
                  ),
                ),
                onTap: () => _selectDate(deadline),
              ),
              AppConst.gapHightSmall,
              Text('[${_textController.text}][${dateToString(deadline)}]')
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectDate(DateTime? initialDate) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime(2100),
      locale: const Locale('ko', 'KR'),
    );
    appLog.info('New Data: ${selectedDate.toString()}');
    if (selectedDate != null) {
      setState(() {
        _textController.text = dateToString(selectedDate);
        deadline = selectedDate;
      });
      appLog.info('New Deadline: ${_textController.text}');
    }
  }
}
