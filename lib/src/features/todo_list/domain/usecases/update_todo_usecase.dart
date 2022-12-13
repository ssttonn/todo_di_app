part of todo_usecases;

@injectable
class UpdateTodoUsecase extends UseCase<Todo, UpdateTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  UpdateTodoUsecase(@injectable this._todoRepository);
  @override
  Future<Todo> call(UpdateTodoUsecaseParams params) {
    return _todoRepository.updateTodo(params.todoId);
  }
}

class UpdateTodoUsecaseParams {
  final String todoId;
  UpdateTodoUsecaseParams({required this.todoId});
}
