import 'package:dartz/dartz.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';
import 'package:todo_app/src/helpers/failure.dart';

abstract class TodoBaseRepository {
  Future<Either<Failure, List<TodoModel>>> fetchAllTodos();
  Future<Either<Failure, TodoModel>> addNewTodo(String title);
  Future<Either<Failure, void>> favoriteTodo(String todoId);
}
