import 'package:flutter/material.dart';

import '../../models/todo.dart';

class TodoListWidget extends StatelessWidget {
  final List<Todo> _todoList;
  final Widget Function(Todo) itemBuilder;
  const TodoListWidget(this._todoList, {required this.itemBuilder});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _todoList.length,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemBuilder: (context, index) {
          Todo _todo = _todoList[index];
          return itemBuilder(_todo);
        });
  }
}
