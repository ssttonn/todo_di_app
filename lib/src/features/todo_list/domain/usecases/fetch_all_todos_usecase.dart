part of todo_usecases;

@LazySingleton()
class FetchAllTodosUsecase extends UseCase<List<TodoModel>, NoParam> {
  final TodoRepository<TodoModel> _todoRepository;

  FetchAllTodosUsecase(@injectable this._todoRepository);

  @override
  Future<List<TodoModel>> call(NoParam params) {
    return _todoRepository.fetchAllTodos();
  }
}
