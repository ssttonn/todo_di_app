import 'package:flutter/material.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

class TodoListWidget extends StatelessWidget {
  final List<TodoModel> _todoList;
  final Widget Function(TodoModel) itemBuilder;
  const TodoListWidget(this._todoList, {required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _todoList.length,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemBuilder: (context, index) {
          TodoModel _todoModel = _todoList[index];
          return itemBuilder(_todoModel);
        });
  }
}
