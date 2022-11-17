import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/base/routes.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/todo_main_page.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/widgets/todo_list_widget.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';
import '../../blocs/todo_list/todo_list_state.dart';

class AllTodosView extends TodoBaseView {
  @override
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Home"),
      centerTitle: true,
    );
  }

  @override
  Widget buildBody(BuildContext context) {
    return _AllTodosBody();
  }

  @override
  FloatingActionButton? buildFloatingButtonAction(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(Routes.create);
        },
        child: Icon(Icons.add));
  }
}

class _AllTodosBody extends StatefulWidget {
  const _AllTodosBody();

  @override
  State<_AllTodosBody> createState() => __AllTodosBodyState();
}

class __AllTodosBodyState extends State<_AllTodosBody> {
  List<TodoModel> _allTodos = [];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoListBloc, TodoListState>(
        buildWhen: (previousState, currentState) {
      return currentState is AllTodosFetched;
    }, builder: (context, state) {
      if (state is FetchingTodos) {
        return CircularProgressIndicator();
      }
      if (state is AllTodosFetched) {
        _allTodos = state.allTodos;
      }
      return TodoListWidget(_allTodos, onFavoriteItem: (todoModel) {
        BlocProvider.of<TodoListBloc>(context)
            .add(FavoriteTodo(todoId: todoModel.id));
      });
    });
  }
}
