part of todo_usecases;

@LazySingleton()
class ListenTodosChangedUsecase extends UseCase<Stream<TodoModel>, NoParam> {
  final TodoRepository<TodoModel> _todoRepository;

  ListenTodosChangedUsecase(@injectable this._todoRepository);

  @override
  Future<Stream<TodoModel>> call(NoParam params) {
    return _todoRepository.todoChanged();
  }
}
