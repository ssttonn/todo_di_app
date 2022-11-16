import 'package:flutter/material.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/widgets/todo_item_widget.dart';

class TodoListWidget extends StatelessWidget {
  final List<TodoModel> _todoList;
  final Function(TodoModel) onFavoriteItem;
  const TodoListWidget(this._todoList, {required this.onFavoriteItem});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _todoList.length,
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        itemBuilder: (context, index) {
          TodoModel _todoModel = _todoList[index];
          return TodoItemWidget(
            _todoModel,
            onFavorite: () => onFavoriteItem(_todoModel),
          );
        });
  }
}
