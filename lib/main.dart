import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/di/injection.dart';
import 'package:todo_app/src/features/todo_list/presenter/ui/pages/todo_main_page.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await configureDependencies();
  } catch (e) {
    print(e);
  } finally {
    runApp(const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoMainPage(),
    );
  }
}
