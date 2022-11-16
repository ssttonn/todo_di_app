import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel _todoModel;
  const TodoItemWidget(this._todoModel);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite_outline),
        Expanded(child: Text(_todoModel.title))
      ],
    );
  }
}
