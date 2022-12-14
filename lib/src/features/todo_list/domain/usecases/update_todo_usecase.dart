part of todo_usecases;

@injectable
class UpdateTodoUsecase extends UseCase<Todo, UpdateTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  UpdateTodoUsecase(@injectable this._todoRepository);
  @override
  Future<Todo> call(UpdateTodoUsecaseParams params) {
    return _todoRepository.updateTodo(params.todo);
  }
}

class UpdateTodoUsecaseParams {
  final Todo todo;
  UpdateTodoUsecaseParams({required this.todo});
}
