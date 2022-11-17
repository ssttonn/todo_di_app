import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/src/features/todo_list/presenter/blocs/create_todo/todo_create_event.dart';
import 'package:todo_app/src/features/todo_list/presenter/blocs/create_todo/todo_create_state.dart';

class TodoCreateBloc extends Bloc<TodoCreateEvent, TodoCreateState> {
  TodoCreateBloc() : super(TodoCreateInitialState()) {
    on<AddNewTodo>((event, emit) {});
  }
}
