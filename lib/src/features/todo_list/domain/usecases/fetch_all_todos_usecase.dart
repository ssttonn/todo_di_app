part of todo_usecases;

@LazySingleton()
class FetchAllTodosUsecase extends UseCase<List<TodoModel>, NoParam> {
  final TodoBaseRepository _todoRepository;

  FetchAllTodosUsecase(@injectable this._todoRepository);

  @override
  Future<Either<Failure, List<TodoModel>>> call(NoParam params) {
    return _todoRepository.fetchAllTodos();
  }
}
