import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/features/todo_list/data/repositories/todo_base_repository.dart';
import 'package:todo_app/src/helpers/failure.dart';

import '../datasources/todo_local_datasource.dart';

abstract class TodoRepository {
  Future<Either<Failure, List<TodoModel>>> fetchAllTodos();
  Future<Either<Failure, TodoModel>> addNewTodo(String title);
  Future<Either<Failure, void>> favoriteTodo(int todoId);
}

@LazySingleton(as: TodoRepository)
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource _dataSource;
  TodoRepositoryImpl(@injectable this._dataSource);

  @override
  Future<Either<Failure, TodoModel>> addNewTodo(String title) async {
    try {
      TodoHiveEntity _newEntity = await _dataSource.addNewTodo(title);
      return Right(_newEntity.toModel());
    } on HiveError catch (e) {
      return Left(CacheFailure(e.message.toString()));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> favoriteTodo(int todoId) async {
    try {
      return Right(await _dataSource.favoriteTodo(todoId));
    } on HiveError catch (e) {
      return Left(CacheFailure(e.message.toString()));
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
    } on HiveError catch (e) {
      return Left(CacheFailure(e.message.toString()));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
