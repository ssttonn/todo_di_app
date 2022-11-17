import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/blocs/todo_list/todo_list_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/blocs/todo_list/todo_list_event.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/todo_main_page.dart';

import '../../../data/models/todo_model.dart';
import '../../blocs/todo_list/todo_list_state.dart';
import '../widgets/todo_list_widget.dart';

class FavoriteTodosView extends TodoBaseView {
  @override
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Favorite"),
      centerTitle: true,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return _FavoriteTodosBody();
  }
}

class _FavoriteTodosBody extends StatefulWidget {
  const _FavoriteTodosBody({Key? key}) : super(key: key);

  @override
  State<_FavoriteTodosBody> createState() => __FavoriteTodosBodyState();
}

class __FavoriteTodosBodyState extends State<_FavoriteTodosBody> {
  List<TodoModel> _favoriteTodos = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(builder: (context, state) {
      if (state is FetchingTodos) {
        return CircularProgressIndicator();
      }
      if (state is AllTodosFetched) {
        _favoriteTodos = state.allTodos;
      }
      return TodoListWidget(_favoriteTodos, onFavoriteItem: (todoModel) {
        BlocProvider.of<TodoListBloc>(context)
            .add(FavoriteTodo(todoId: todoModel.id));
      });
    });
  }
}
