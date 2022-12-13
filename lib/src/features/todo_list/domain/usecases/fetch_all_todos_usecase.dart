part of todo_usecases;

@injectable
class FetchAllTodosUsecase extends UseCase<List<Todo>, NoParam> {
  final TodoRepository _todoRepository;

  FetchAllTodosUsecase(@injectable this._todoRepository);

  @override
  Future<List<Todo>> call(NoParam params) {
    return _todoRepository.fetchAllTodos();
  }
}
