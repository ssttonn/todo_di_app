part of todo_usecases;

@injectable
class AddNewTodoUsecase extends UseCase<Todo, AddNewTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  AddNewTodoUsecase(@injectable this._todoRepository);

  @override
  Future<Todo> call(AddNewTodoUsecaseParams params) {
    return _todoRepository.addNewTodo(params.title);
  }
}

class AddNewTodoUsecaseParams {
  final String title;

  AddNewTodoUsecaseParams({required this.title});
}
