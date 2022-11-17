import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/domain/usecases/todo_usecases.dart';
import 'package:todo_app/src/helpers/usecase.dart';
import 'todo_list_state.dart';
import 'todo_list_event.dart';

@injectable
class TodoListBloc extends Bloc<TodoListEvent, TodoListState> {
  final FetchAllTodosUsecase _fetchAllTodosUsecase;
  final FavoriteTodoUsecase _favoriteTodoUsecase;
  final AddNewTodoUsecase _addNewTodoUsecase;

  TodoListBloc(
      @injectable this._fetchAllTodosUsecase,
      @injectable this._favoriteTodoUsecase,
      @injectable this._addNewTodoUsecase)
      : super(TodoListState.initial()) {
    on<FetchAllTodos>(((event, emit) async {
      try {
        emit(state.copyWith(state: TodoState.fetchingTodos));
        final allTodos = await _fetchAllTodosUsecase(NoParam());
        emit(state.copyWith(
            allTodos: allTodos, state: TodoState.fetchTodosSuccess));
      } catch (e) {
        emit(state.copyWith(state: TodoState.failure));
      }
    }));

    on<AddNewTodo>((event, emit) async {
      try {
        emit(state.copyWith(state: TodoState.addingNewTodo));
        TodoModel _newTodoModel = await _addNewTodoUsecase(
            AddNewTodoUsecaseParams(title: event.newTodoTitle));
        emit(state.copyWith(
            allTodos: state.allTodos..insert(0, _newTodoModel),
            state: TodoState.newTodoAdded));
      } catch (e) {
        emit(state.copyWith(state: TodoState.failure));
      }
    });

    on<FavoriteTodo>((event, emit) async {
      try {
        emit(state.copyWith(state: TodoState.todoBeingFavorite));
        TodoModel _todoModel = await _favoriteTodoUsecase(
            FavoriteTodoUsecaseParams(todoId: event.todoId));
        state.allTodos[state.allTodos
            .indexWhere((todo) => todo.id == _todoModel.id)] = _todoModel;
        emit(state.copyWith(
            allTodos: state.allTodos, state: TodoState.todoFavorited));
      } catch (e) {
        emit(state.copyWith(state: TodoState.failure));
      }
    });
  }
}
