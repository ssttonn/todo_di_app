import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:todo_app/src/base/exception.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

abstract class BaseTodoRemoteDataSource {
  Future<List<TodoModel>> fetchAllTodos();
  Future<TodoModel> addNewTodo(String title);
  Future<TodoModel> updateTodo(TodoModel todoModel);
  Future<TodoModel> getTodoDetail(String todoId);
  Future<void> deleteTodo(String todoId);
}

@Injectable(as: BaseTodoRemoteDataSource)
class TodoRemoteDataSource implements BaseTodoRemoteDataSource {
  final Dio dioClient;

  TodoRemoteDataSource({@injectable required this.dioClient}) {
    dioClient.options = BaseOptions(headers: {
      HttpHeaders.contentTypeHeader: "application/json",
    });
  }

  @override
  Future<TodoModel> addNewTodo(String title) async {
    try {
      final response = await dioClient.post("/todos", data: {"title": title});
      return TodoModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(
          message: e is DioError
              ? (e.response?.data["message"] ?? e.message)
              : e.toString(),
          statusCode: e is DioError ? (e.response?.statusCode ?? 400) : 400,
          error: e);
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    try {
      await dioClient.delete("/todos/$todoId");
    } catch (e) {
      throw ServerException(
          message: e is DioError
              ? (e.response?.data["message"] ?? e.message)
              : e.toString(),
          statusCode: e is DioError ? (e.response?.statusCode ?? 400) : 400,
          error: e);
    }
  }

  @override
  Future<List<TodoModel>> fetchAllTodos() async {
    try {
      final response = await dioClient.get("/todos");
      return (response.data as List? ?? []).map((json) {
        return TodoModel.fromJson(json);
      }).toList();
    } catch (e) {
      throw ServerException(
          message: e is DioError
              ? (e.response?.data["message"] ?? e.message)
              : e.toString(),
          statusCode: e is DioError ? (e.response?.statusCode ?? 400) : 400,
          error: e);
    }
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todoModel) async {
    try {
      final response = await dioClient.put(
        "/todos/${todoModel.id}",
      );
      return TodoModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(
          message: e is DioError
              ? (e.response?.data["message"] ?? e.message)
              : e.toString(),
          statusCode: e is DioError ? (e.response?.statusCode ?? 400) : 400,
          error: e);
    }
  }

  @override
  Future<TodoModel> getTodoDetail(String todoId) async {
    try {
      final response = await dioClient.get("/todos/$todoId");
      return TodoModel.fromJson(response.data);
    } catch (e) {
      throw ServerException(
          message: e is DioError
              ? (e.response?.data["message"] ?? e.message)
              : e.toString(),
          statusCode: e is DioError ? (e.response?.statusCode ?? 400) : 400,
          error: e);
    }
  }
}
