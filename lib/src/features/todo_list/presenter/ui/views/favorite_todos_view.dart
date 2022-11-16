import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/todo_main_page.dart';

import '../../bloc/todo_cubit.dart';
import '../../bloc/todo_state.dart';
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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoCubit, TodoState>(
        buildWhen: (previous, current) =>
            previous.favoriteTodos.length != current.favoriteTodos.length,
        builder: (context, state) {
          if (state.isFetchingTodos) {
            return CircularProgressIndicator();
          }
          return TodoListWidget(state.favoriteTodos,
              onFavoriteItem: (todoModel) {
            BlocProvider.of<TodoCubit>(context).favoriteTodo(todoModel.id);
          });
        });
  }
}
