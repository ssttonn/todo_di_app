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
import '../features/todo_list/data/repositories/todo_repository.dart' as _i6;
import '../features/todo_list/domain/usecases/todo_usecases.dart' as _i7;
import '../features/todo_list/presenter/bloc/todo_cubit.dart' as _i8;
import 'todo_module.dart' as _i9; // ignore_for_file: unnecessary_lambdas

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
  gh.lazySingletonAsync<_i5.TodoLocalDataSource>(() async =>
      _i5.TodoLocalDataSourceImpl(
          hiveBox: await get.getAsync<_i3.Box<_i4.TodoHiveEntity>>()));
  gh.lazySingletonAsync<_i6.TodoRepository>(() async =>
      _i6.TodoRepositoryImpl(await get.getAsync<_i5.TodoLocalDataSource>()));
  gh.lazySingletonAsync<_i7.AddNewTodoUsecase>(() async =>
      _i7.AddNewTodoUsecase(await get.getAsync<_i6.TodoRepository>()));
  gh.lazySingletonAsync<_i7.FavoriteTodoUsecase>(() async =>
      _i7.FavoriteTodoUsecase(await get.getAsync<_i6.TodoRepository>()));
  gh.lazySingletonAsync<_i7.FetchAllTodosUsecase>(() async =>
      _i7.FetchAllTodosUsecase(await get.getAsync<_i6.TodoRepository>()));
  gh.singletonAsync<_i8.TodoCubit>(() async => _i8.TodoCubit(
        await get.getAsync<_i7.FetchAllTodosUsecase>(),
        await get.getAsync<_i7.AddNewTodoUsecase>(),
        await get.getAsync<_i7.FavoriteTodoUsecase>(),
      ));
  return get;
}

class _$RegisterModule extends _i9.RegisterModule {}
