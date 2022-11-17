// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../features/todo_list/data/datasources/todo_local_datasource.dart'
    as _i5;
import '../features/todo_list/data/entities/todo_entity.dart' as _i4;
import '../features/todo_list/data/models/todo_model.dart' as _i7;
import '../features/todo_list/data/repositories/todo_repository.dart' as _i6;
import '../features/todo_list/domain/usecases/todo_usecases.dart' as _i8;
import '../features/todo_list/presenter/blocs/todo_list/todo_list_bloc.dart'
    as _i9;
import 'todo_module.dart' as _i10; // ignore_for_file: unnecessary_lambdas

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
  final registerModule = _$RegisterModule();
  gh.singletonAsync<_i3.Box<_i4.TodoHiveEntity>>(
      () => registerModule.todoBox());
  gh.lazySingletonAsync<_i5.TodoLocalDataSource<_i4.TodoHiveEntity>>(() async =>
      _i5.TodoLocalDataSourceImpl(
          hiveBox: await get.getAsync<_i3.Box<_i4.TodoHiveEntity>>()));
  gh.lazySingletonAsync<_i6.TodoRepository<_i7.TodoModel>>(
      () async => _i6.TodoRepositoryImpl(
            await get.getAsync<_i5.TodoLocalDataSource<_i4.TodoHiveEntity>>(),
            await get.getAsync<_i3.Box<_i4.TodoHiveEntity>>(),
          ));
  gh.lazySingletonAsync<_i8.AddNewTodoUsecase>(() async =>
      _i8.AddNewTodoUsecase(
          await get.getAsync<_i6.TodoRepository<_i7.TodoModel>>()));
  gh.lazySingletonAsync<_i8.FavoriteTodoUsecase>(() async =>
      _i8.FavoriteTodoUsecase(
          await get.getAsync<_i6.TodoRepository<_i7.TodoModel>>()));
  gh.lazySingletonAsync<_i8.FetchAllTodosUsecase>(() async =>
      _i8.FetchAllTodosUsecase(
          await get.getAsync<_i6.TodoRepository<_i7.TodoModel>>()));
  gh.lazySingletonAsync<_i8.ListenTodosChangedUsecase>(() async =>
      _i8.ListenTodosChangedUsecase(
          await get.getAsync<_i6.TodoRepository<_i7.TodoModel>>()));
  gh.singletonAsync<_i9.TodoListBloc>(() async => _i9.TodoListBloc(
        await get.getAsync<_i8.FetchAllTodosUsecase>(),
        await get.getAsync<_i8.AddNewTodoUsecase>(),
        await get.getAsync<_i8.FavoriteTodoUsecase>(),
        await get.getAsync<_i8.ListenTodosChangedUsecase>(),
      ));
  return get;
}

class _$RegisterModule extends _i10.RegisterModule {}
