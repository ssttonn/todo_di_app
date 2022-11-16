import 'package:injectable/injectable.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

@module
abstract class RegisterModule {
  @Singleton()
  Future<Box> todoBox() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    return Hive.openBox("todo");
  }
}
