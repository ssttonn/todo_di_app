import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';
import '../../blocs/todo_list/todo_list_state.dart';
import '../widgets/todo_item_widget.dart';
import '../widgets/todo_list_widget.dart';

class FavoriteTodosPage extends StatefulWidget {
  const FavoriteTodosPage({Key? key}) : super(key: key);

  @override
  State<FavoriteTodosPage> createState() => _FavoriteTodosPageState();
}

class _FavoriteTodosPageState extends State<FavoriteTodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Favorite"), centerTitle: true),
        body: _body());
  }

  Widget _body() {
    return BlocBuilder<TodoListBloc, TodoListState>(
        buildWhen: (previousState, currentState) {
      return currentState.state == TodoState.fetchingTodos ||
          currentState.state == TodoState.newTodoAdded ||
          currentState.state == TodoState.fetchTodosSuccess ||
          currentState.state == TodoState.todoFavorited;
    }, builder: (context, state) {
      return TodoListWidget(state.favoriteTodos, itemBuilder: ((todoModel) {
        return TodoItemWidget(
          todoModel,
          onFavorite: () {
            BlocProvider.of<TodoListBloc>(context)
                .add(FavoriteTodo(todoId: todoModel.id));
          },
        );
      }));
    });
  }
}
