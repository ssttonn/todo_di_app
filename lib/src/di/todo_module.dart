import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:todo_app/src/features/todo_list/data/entities/todo_entity.dart';

@module
abstract class RegisterModule {
  @Singleton()
  Future<Box<TodoHiveEntity>> todoBox() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    Hive.registerAdapter(TodoHiveEntityAdapter());
    return Hive.openBox<TodoHiveEntity>("todos");
  }
}
