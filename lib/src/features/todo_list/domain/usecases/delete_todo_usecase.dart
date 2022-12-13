part of todo_usecases;

@injectable
class DeleteTodoUsecase extends UseCase<void, DeleteTodoUsecaseParams> {
  final TodoRepository _todoRepository;

  DeleteTodoUsecase(@injectable this._todoRepository);

  @override
  Future<void> call(DeleteTodoUsecaseParams params) {
    return _todoRepository.deleteTodo(params.todoId);
  }
}

class DeleteTodoUsecaseParams {
  final String todoId;

  DeleteTodoUsecaseParams({required this.todoId});
}
