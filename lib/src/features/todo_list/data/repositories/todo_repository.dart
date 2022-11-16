import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/datasources/todo_base_datasource.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/data/repositories/todo_base_repository.dart';
import 'package:todo_app/src/helpers/failure.dart';

@LazySingleton(as: TodoBaseRepository)
class TodoRepository implements TodoBaseRepository {
  final TodoBaseDataSource _dataSource;
  TodoRepository(@injectable this._dataSource);

  @override
  Future<Either<Failure, TodoModel>> addNewTodo(String title) async {
    try {
      TodoHiveEntity _newEntity = await _dataSource.addNewTodo(title);
      return Right(_newEntity.toModel());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> favoriteTodo(String todoId) async {
    try {
      return Right(await _dataSource.favoriteTodo(todoId));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<TodoModel>>> fetchAllTodos() async {
    try {
      return Right((await _dataSource.fetchAllTodos())
          .map((entity) => entity.toModel())
          .toList());
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
