part of todo_usecases;

@LazySingleton()
class AddNewTodoUsecase extends UseCase<void, AddNewTodoUsecaseParams> {
  final TodoRepository<TodoModel> _todoRepository;

  AddNewTodoUsecase(@injectable this._todoRepository);

  @override
  Future<void> call(AddNewTodoUsecaseParams params) {
    return _todoRepository.addNewTodo(params.title);
  }
}

class AddNewTodoUsecaseParams {
  final String title;

  AddNewTodoUsecaseParams({required this.title});
}
