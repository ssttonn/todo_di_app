// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/todo_list/data/datasources/todo_local_datasource.dart'
    as _i3;
import '../features/todo_list/data/entities/todo_entity.dart' as _i4;
import '../features/todo_list/data/models/todo_model.dart' as _i6;
import '../features/todo_list/data/repositories/todo_repository.dart' as _i5;
import '../features/todo_list/domain/usecases/todo_usecases.dart' as _i7;
import '../features/todo_list/presenter/blocs/todo_list/todo_list_bloc.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.TodoLocalDataSource<_i4.TodoEntity>>(
      () => _i3.TodoMockDataSourceImpl());
  gh.factory<_i5.TodoRepository<_i6.TodoModel>>(() =>
      _i5.TodoRepositoryImpl(get<_i3.TodoLocalDataSource<_i4.TodoEntity>>()));
  gh.factory<_i7.AddNewTodoUsecase>(
      () => _i7.AddNewTodoUsecase(get<_i5.TodoRepository<_i6.TodoModel>>()));
  gh.factory<_i7.FavoriteTodoUsecase>(
      () => _i7.FavoriteTodoUsecase(get<_i5.TodoRepository<_i6.TodoModel>>()));
  gh.factory<_i7.FetchAllTodosUsecase>(
      () => _i7.FetchAllTodosUsecase(get<_i5.TodoRepository<_i6.TodoModel>>()));
  gh.singleton<_i8.TodoListBloc>(_i8.TodoListBloc(
    get<_i7.FetchAllTodosUsecase>(),
    get<_i7.FavoriteTodoUsecase>(),
    get<_i7.AddNewTodoUsecase>(),
  ));
  return get;
}
