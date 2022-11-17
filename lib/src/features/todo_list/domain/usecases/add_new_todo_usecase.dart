part of todo_usecases;

@injectable
class AddNewTodoUsecase extends UseCase<TodoModel, AddNewTodoUsecaseParams> {
  final TodoRepository<TodoModel> _todoRepository;

  AddNewTodoUsecase(@injectable this._todoRepository);

  @override
  Future<TodoModel> call(AddNewTodoUsecaseParams params) {
    return _todoRepository.addNewTodo(params.title);
  }
}

class AddNewTodoUsecaseParams {
  final String title;

  AddNewTodoUsecaseParams({required this.title});
}
