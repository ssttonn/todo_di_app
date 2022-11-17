part of todo_usecases;

@injectable
class FavoriteTodoUsecase
    extends UseCase<TodoModel, FavoriteTodoUsecaseParams> {
  final TodoRepository<TodoModel> _todoRepository;

  FavoriteTodoUsecase(@injectable this._todoRepository);
  @override
  Future<TodoModel> call(FavoriteTodoUsecaseParams params) {
    return _todoRepository.favoriteTodo(params.todoId);
  }
}

class FavoriteTodoUsecaseParams {
  final int todoId;
  FavoriteTodoUsecaseParams({required this.todoId});
}
