// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:todo_app/src/features/todo_list/domain/usecases/todo_usecases.dart';
// import 'package:todo_app/src/helpers/usecase.dart';
// import '../../data/models/todo_model.dart';
// import 'todo/todo_state.dart';
// import 'package:collection/collection.dart';

// @Singleton()
// class TodoCubit extends Cubit<TodoState> {
//   final FetchAllTodosUsecase _fetchAllTodosUsecase;
//   final AddNewTodoUsecase _addNewTodoUsecase;
//   final FavoriteTodoUsecase _favoriteTodoUsecase;
//   TodoCubit(
//       @injectable this._fetchAllTodosUsecase,
//       @injectable this._addNewTodoUsecase,
//       @injectable this._favoriteTodoUsecase)
//       : super(TodoState());

//   void fetchAllTodos() {
//     emit(state.copyWith(isFetchingTodos: true));
//     _fetchAllTodosUsecase(NoParam()).then((either) {
//       if (either.isRight()) {
//         emit(state.copyWith(
//             allTodos: either.getOrElse(() => []),
//             isFetchingTodos: false,
//             forceRerender: true));
//       }
//     });
//   }

//   void favoriteTodo(int todoId) {
//     /// Get all todos from current state
//     List<TodoModel> _allTodos = List.from(state.allTodos);

//     /// Find the [TodoModel] with cosresponding todoId
//     TodoModel? _favoritedTodoModel =
//         _allTodos.firstWhereOrNull((todo) => todo.id == todoId);
//     if (_favoritedTodoModel == null) {
//       /// Return an error if todo not found
//       emit(state.copyWith(
//           errorMessage: "Unable to find todo item with id: $todoId"));
//       return;
//     }
//     _favoriteTodoUsecase(FavoriteTodoUsecaseParams(todoId: todoId))
//         .then((either) {
//       if (either.isRight()) {
//         /// if the progress is success, update new favorite state
//         _favoritedTodoModel.isFavorite = !_favoritedTodoModel.isFavorite;
//         emit(state.copyWith(allTodos: _allTodos));
//       }
//     });
//   }

//   Future<bool> addNewTodo(String title) {
//     emit(state.copyWith(isAddingNewTodo: true));
//     return _addNewTodoUsecase(AddNewTodoUsecaseParams(title: title))
//         .then((either) {
//       either.fold((failure) {
//         emit(state.copyWith(
//             errorMessage: failure.message, isAddingNewTodo: false));
//       }, (newTodo) {
//         List<TodoModel> _allTodos = List.from(state.allTodos);
//         _allTodos.insert(0, newTodo);
//         emit(state.copyWith(
//             allTodos: _allTodos, isAddingNewTodo: false, forceRerender: true));
//       });
//       return either.isRight();
//     });
//   }
// }
