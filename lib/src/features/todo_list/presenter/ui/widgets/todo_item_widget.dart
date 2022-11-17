import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/shared/widgets/spacing_row.dart';

class TodoItemWidget extends StatelessWidget {
  final TodoModel _todoModel;
  final VoidCallback onFavorite;
  const TodoItemWidget(this._todoModel, {required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SpacingRow(
        spacing: 10,
        children: [
          CupertinoButton(
              child: Icon(
                  _todoModel.favoriteAt != null
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 30),
              onPressed: onFavorite,
              padding: EdgeInsets.zero),
          Expanded(
              child: Text(_todoModel.title,
                  style: Theme.of(context).textTheme.subtitle1))
        ],
      ),
    );
  }
}
