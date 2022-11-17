import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/domain/usecases/todo_usecases.dart';
import 'package:todo_app/src/helpers/usecase.dart';
import 'todo_list_state.dart';
import 'todo_list_event.dart';

@Singleton()
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final FetchAllTodosUsecase _fetchAllTodosUsecase;
  // final AddNewTodoUsecase _addNewTodoUsecase;
  // final FavoriteTodoUsecase _favoriteTodoUsecase;
  final ListenTodosChangedUsecase _listenTodosChangedUsecase;
  TodoListBloc(
      @injectable this._fetchAllTodosUsecase,
      // @injectable this._addNewTodoUsecase,
      // @injectable this._favoriteTodoUsecase,
      @injectable this._listenTodosChangedUsecase)
      : super(TodoListInitialState()) {
    on<ListenToAllTodosChanged>((event, emit) async {
      await emit.forEach<TodoModel>(await _listenTodosChangedUsecase(NoParam()),
          onData: (todo) {
        return TodoItemUpdated(todoModel: todo);
      });
    });

    on<FetchAllTodos>(((event, emit) async {
      try {
        final allTodos = await _fetchAllTodosUsecase(NoParam());
        emit(AllTodosFetched(allTodos: allTodos));
      } on HiveError catch (e) {
        emit(TodoListFailure(errorMessage: e.message));
      } catch (e) {
        emit(TodoListFailure(errorMessage: e.toString()));
      }
    }));

    // on<AddNewTodo>((event, emit) async {
    //   try {
    //     await _addNewTodoUsecase(
    //         AddNewTodoUsecaseParams(title: event.newTodoTitle));
    //     emit(NewTodoAdded());
    //   } on HiveError catch (e) {
    //     emit(TodoListFailure(errorMessage: e.message));
    //   } catch (e) {
    //     emit(TodoListFailure(errorMessage: e.toString()));
    //   }
    // });

    // on<FavoriteTodo>((event, emit) async {
    //   try {
    //     await _favoriteTodoUsecase(
    //         FavoriteTodoUsecaseParams(todoId: event.todoId));
    //     emit(TodoIsFavorited(todoId: event.todoId));
    //   } on HiveError catch (e) {
    //     emit(TodoListFailure(errorMessage: e.message));
    //   } catch (e) {
    //     emit(TodoListFailure(errorMessage: e.toString()));
    //   }
    // });
  }
}
