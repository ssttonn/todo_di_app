import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart' as inj;
import 'package:todo_app/src/base/exception.dart';
import 'package:todo_app/src/features/todo_list/data/datasources/todo_remote_datasource.dart';
import 'package:todo_app/src/features/todo_list/data/models/todo_model.dart';

import '../../../../di/injection.dart';

@inj.Injectable(as: BaseTodoRemoteDataSource)
class MockTodoRemoteDataSource extends TodoRemoteDataSource {
  MockTodoRemoteDataSource({@inj.injectable required Dio dio})
      : super(dioClient: dio);
}

void main() {
  late DioAdapter dioAdapter;
  late BaseTodoRemoteDataSource todoRemoteDataSource;

  setUpAll(() {
    configureDependencies();
  });

  setUp(() {
    dioAdapter = getIt<DioAdapter>();
    todoRemoteDataSource = getIt<BaseTodoRemoteDataSource>();
  });

  group("Get all todos", () {
    test("Get all todos + status code 200 + has response", () async {
      dioAdapter.onGet(
        "/todos",
        (server) => server.reply(
          200,
          _fakeData,
        ),
      );

      final todos = await todoRemoteDataSource.fetchAllTodos();

      expect(todos[0].id, "1");
      expect(todos[0].favoriteAt, isNotNull);
      expect(todos[0].finishedAt, isNotNull);
      expect(todos.length, 13);
    });

    test("Get all todos + status code 200 + has no response", () async {
      dioAdapter.onGet(
        "/todos",
        (server) => server.reply(
          200,
          null,
        ),
      );

      final todos = await todoRemoteDataSource.fetchAllTodos();
      expect(todos.length, 0);
    });

    test("Get all todos with status code 404 + check if error is DioError",
        () async {
      dioAdapter.onGet(
        "/todos",
        (server) => server.reply(
          404,
          {"message": "Not found!!!"},
        ),
      );
      try {
        await todoRemoteDataSource.fetchAllTodos();
      } catch (e) {
        expect(e, isA<ServerException>());
        expect((e as ServerException).error, isA<DioError>());
        expect(e.message, "Not found!!!");
        expect(e.statusCode, 404);
      }
    });
  });

  group("Add new todo", () {
    test("Add new todo + title is Abc + no error", () async {
      String newTodoTitle = "Abc";
      dioAdapter.onPost(
        "/todos",
        data: {"title": newTodoTitle},
        (server) => server.reply(
          200,
          {"title": newTodoTitle, "id": "1"},
        ),
      );
      final newTodoModel = await todoRemoteDataSource.addNewTodo(newTodoTitle);

      expect(newTodoModel, isA<TodoModel>());
      expect(newTodoModel.id, "1");
      expect(newTodoModel.favoriteAt, null);
      expect(newTodoModel.finishedAt, null);
      expect(newTodoModel.title, newTodoTitle);
    });

    test(
        "Add new todo + title is Abc + has 401 error + check if it's thrown ServerException + error is DioError",
        () async {
      String newTodoTitle = "Abc";
      dioAdapter.onPost(
        "/todos",
        data: {"title": newTodoTitle},
        (server) => server.reply(
          401,
          {"message": "Unauthorized"},
        ),
      );
      try {
        await todoRemoteDataSource.addNewTodo(newTodoTitle);
      } catch (e) {
        expect(e, isA<ServerException>());
        expect((e as ServerException).error, isA<DioError>());
        expect((e).message, "Unauthorized");
        expect((e).statusCode, 401);
      }
    });
  });

  group("Get todo detail", () {
    test(
        "Get todo detail + id: 1 + hasn't favorited + hasn't finished + no error",
        () async {
      String todoId = "1";
      dioAdapter.onGet("/todos/$todoId", (server) {
        return server.reply(200, {"title": "title 1", "id": todoId});
      });

      final todoModel = await todoRemoteDataSource.getTodoDetail(todoId);
      expect(todoModel, isA<TodoModel>());
      expect(todoModel.id, todoId);
      expect(todoModel.favoriteAt, null);
      expect(todoModel.finishedAt, null);
      expect(todoModel.title, "title 1");
    });

    test("Get todo detail + id: 1 + has favorited + has finished + no error",
        () async {
      String todoId = "1";
      dioAdapter.onGet("/todos/$todoId", (server) {
        return server.reply(200, {
          "title": "title 1",
          "favorite_at": 1670939784,
          "finish_at": 1670939784,
          "id": todoId
        });
      });
      final todoModel = await todoRemoteDataSource.getTodoDetail(todoId);
      expect(todoModel, isA<TodoModel>());
      expect(todoModel.id, todoId);
      expect(todoModel.favoriteAt.toString(), "1970-01-20 16:08:59.784");
      expect(todoModel.finishedAt.toString(), "1970-01-20 16:08:59.784");
      expect(todoModel.title, "title 1");
    });

    test(
        "Get todo detail + id: 2 + status code 404 + check if it's thrown ServerException + error is DioError",
        () async {
      String todoId = "2";
      dioAdapter.onGet("/todos/$todoId", (server) {
        return server.reply(404, {"message": "Not found!!!"});
      });
      try {
        await todoRemoteDataSource.getTodoDetail(todoId);
      } catch (e) {
        expect(e, isA<ServerException>());
        expect((e as ServerException).error, isA<DioError>());
        expect(e.message, "Not found!!!");
        expect((e).statusCode, 404);
      }
    });
  });

  group("Delete todo", () {
    test("Delete todo + id: 1 + no error", () {
      String todoId = "1";
      dioAdapter.onDelete("/todos/$todoId", (server) {
        return server.reply(200, {"message": "Success"});
      });
      expect(todoRemoteDataSource.deleteTodo(todoId), completion(equals(null)));
    });

    test(
        "Delete todo + id: 2 + status code 404 + check if it's thrown ServerException + error is DioError",
        () async {
      String todoId = "2";
      dioAdapter.onDelete("/todos/$todoId", (server) {
        return server.reply(404, {"message": "Not found!!!"});
      });
      try {
        await todoRemoteDataSource.deleteTodo(todoId);
      } catch (e) {
        expect(e, isA<ServerException>());
        expect((e as ServerException).error, isA<DioError>());
        expect(e.message, "Not found!!!");
        expect((e).statusCode, 404);
      }
    });
  });

  group("Update todo", () {
    test("Update todo + id: 1 + no error", () {});
  });
}

List<Map<String, dynamic>> _fakeData = [
  {
    "title": "title 1",
    "favorite_at": 1670939784,
    "finish_at": 1670939784,
    "id": "1"
  },
  {
    "title": "title 2",
    "favorite_at": 1670939724,
    "finish_at": 1670939724,
    "id": "2"
  },
  {
    "title": "title 3",
    "favorite_at": 1670939664,
    "finish_at": 1670939664,
    "id": "3"
  },
  {
    "title": "title 4",
    "favorite_at": 1670939604,
    "finish_at": 1670939604,
    "id": "4"
  },
  {
    "title": "title 5",
    "favorite_at": 1670939544,
    "finish_at": 1670939544,
    "id": "5"
  },
  {
    "title": "title 6",
    "favorite_at": 1670939484,
    "finish_at": 1670939484,
    "id": "6"
  },
  {
    "title": "title 7",
    "favorite_at": 1670939424,
    "finish_at": 1670939424,
    "id": "7"
  },
  {
    "title": "title 8",
    "favorite_at": 1670939364,
    "finish_at": 1670939364,
    "id": "8"
  },
  {
    "title": "title 9",
    "favorite_at": 1670939304,
    "finish_at": 1670939304,
    "id": "9"
  },
  {
    "title": "title 10",
    "favorite_at": 1670939244,
    "finish_at": 1670939244,
    "id": "10"
  },
  {
    "title": "title 11",
    "favorite_at": 1670939184,
    "finish_at": 1670939184,
    "id": "11"
  },
  {
    "title": "title 12",
    "favorite_at": 1670939124,
    "finish_at": 1670939124,
    "id": "12"
  },
  {
    "title": "title 13",
    "favorite_at": 1670939064,
    "finish_at": 1670939064,
    "id": "13"
  }
];
