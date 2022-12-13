library todo_usecases;

import 'package:injectable/injectable.dart';
import 'package:todo_app/src/features/todo_list/presentation/models/todo.dart';

import '../../../../helpers/usecase.dart';
import '../../data/repositories/todo_repository.dart';

part 'add_new_todo_usecase.dart';
part 'fetch_all_todos_usecase.dart';
part 'update_todo_usecase.dart';
part 'delete_todo_usecase.dart';
