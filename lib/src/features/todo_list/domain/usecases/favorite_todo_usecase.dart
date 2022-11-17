part of todo_usecases;

@LazySingleton()
class FavoriteTodoUsecase extends UseCase<void, FavoriteTodoUsecaseParams> {
  final TodoRepository<TodoModel> _todoRepository;

  FavoriteTodoUsecase(@injectable this._todoRepository);
  @override
  Future<void> call(FavoriteTodoUsecaseParams params) {
    return _todoRepository.favoriteTodo(params.todoId);
  }
}

class FavoriteTodoUsecaseParams {
  final int todoId;
  FavoriteTodoUsecaseParams({required this.todoId});
}
