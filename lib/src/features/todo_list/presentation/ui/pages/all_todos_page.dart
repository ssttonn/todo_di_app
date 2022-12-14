import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/todo_list/todo_list_bloc.dart';
import '../../blocs/todo_list/todo_list_event.dart';
import '../../blocs/todo_list/todo_list_state.dart';
import '../widgets/todo_item_widget.dart';
import '../widgets/todo_list_widget.dart';

class AllTodosPage extends StatefulWidget {
  const AllTodosPage({Key? key}) : super(key: key);

  @override
  State<AllTodosPage> createState() => _AllTodosPageState();
}

class _AllTodosPageState extends State<AllTodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        centerTitle: true,
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).pushNamed("/create");
          }),
    );
  }

  Widget _body() {
    return BlocBuilder<TodoListBloc, TodoListState>(
        buildWhen: (previousState, currentState) {
      return currentState.state == TodoState.fetchingTodos ||
          currentState.state == TodoState.newTodoAdded ||
          currentState.state == TodoState.fetchTodosSuccess ||
          currentState.state == TodoState.todoFavorited;
    }, builder: (context, state) {
      return TodoListWidget(state.allTodos, itemBuilder: ((todo) {
        return TodoItemWidget(
          todo,
          onFavorite: () {
            // BlocProvider.of<TodoListBloc>(context)
            //     .add(FavoriteTodo(todoId: todo.id));
          },
        );
      }));
    });
  }
}
