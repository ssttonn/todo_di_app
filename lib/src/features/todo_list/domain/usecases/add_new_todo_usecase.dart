part of todo_usecases;

@LazySingleton()
class AddNewTodoUsecase extends UseCase<TodoModel, AddNewTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  AddNewTodoUsecase(@injectable this._todoRepository);

  @override
  Future<Either<Failure, TodoModel>> call(AddNewTodoUsecaseParams params) {
    return _todoRepository.addNewTodo(params.title);
  }
}

class AddNewTodoUsecaseParams {
  final String title;

  AddNewTodoUsecaseParams({required this.title});
}
