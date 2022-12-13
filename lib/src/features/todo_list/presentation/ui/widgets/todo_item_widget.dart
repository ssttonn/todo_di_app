import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/src/shared/widgets/spacing_row.dart';

import '../../models/todo.dart';

class TodoItemWidget extends StatelessWidget {
  final Todo _todo;
  final VoidCallback onFavorite;
  const TodoItemWidget(this._todo, {required this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SpacingRow(
        spacing: 10,
        children: [
          CupertinoButton(
              child: Icon(
                  _todo.favoriteAt != null
                      ? Icons.favorite
                      : Icons.favorite_outline,
                  size: 30),
              onPressed: onFavorite,
              padding: EdgeInsets.zero),
          Expanded(
              child: Text(_todo.title,
                  style: Theme.of(context).textTheme.subtitle1))
        ],
      ),
    );
  }
}
