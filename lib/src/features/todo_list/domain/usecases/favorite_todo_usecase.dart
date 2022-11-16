import 'package:injectable/injectable.dart';
import 'package:todo_app/src/helpers/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:todo_app/src/helpers/usecase.dart';

import '../../data/repositories/todo_base_repository.dart';

@LazySingleton()
class FavoriteTodoUsecase extends UseCase<void, FavoriteTodoUsecaseParams> {
  final TodoBaseRepository _todoRepository;

  FavoriteTodoUsecase(@injectable this._todoRepository);
  @override
  Future<Either<Failure, void>> call(FavoriteTodoUsecaseParams params) {
    return _todoRepository.favoriteTodo(params.todoId);
  }
}

class FavoriteTodoUsecaseParams {
  final String todoId;
  FavoriteTodoUsecaseParams({required this.todoId});
}
