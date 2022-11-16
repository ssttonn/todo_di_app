import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/base/routes.dart';
import 'package:todo_app/src/features/todo_list/presenter/bloc/todo_cubit.dart';
import 'package:todo_app/src/features/todo_list/presenter/bloc/todo_state.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/todo_main_page.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/widgets/todo_list_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(buildWhen: (previous, current) {
      return current.forceRerender;
    }, builder: (context, state) {
      if (state.isFetchingTodos) {
        return CircularProgressIndicator();
      }
      return TodoListWidget(state.allTodos, onFavoriteItem: (todoModel) {
        BlocProvider.of<TodoCubit>(context).favoriteTodo(todoModel.id);
      });
    });
  }
}
