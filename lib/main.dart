import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_app/src/base/routes.dart';
import 'package:todo_app/src/di/injection.dart';

import 'src/features/todo_list/presenter/bloc/todo_cubit.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    configureDependencies();
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: FutureBuilder(
          future: getIt.allReady(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return BlocProvider.value(
                value: getIt<TodoCubit>(),
                child: MaterialApp(
                  title: 'Flutter Demo',
                  theme: ThemeData(
                    primarySwatch: Colors.blue,
                  ),
                  onGenerateRoute: routeHandler,
                  initialRoute: "/",
                ),
              );
            } else {
              return Container(color: Colors.white);
            }
          }),
    );
  }
}
