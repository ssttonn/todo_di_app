// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:hive/hive.dart' as _i3;
import 'package:injectable/injectable.dart' as _i2;

import '../features/todo_list/data/datasources/todo_base_datasource.dart'
    as _i4;
import '../features/todo_list/data/datasources/todo_local_datasource.dart'
    as _i5;
import '../features/todo_list/data/repositories/todo_base_repository.dart'
    as _i6;
import '../features/todo_list/data/repositories/todo_repository.dart' as _i7;
import '../features/todo_list/domain/usecases/favorite_todo_usecase.dart'
    as _i9;
import '../features/todo_list/domain/usecases/todo_usecases.dart' as _i8;
import '../features/todo_list/presenter/bloc/todo_cubit.dart' as _i10;
import 'todo_module.dart' as _i11; // ignore_for_file: unnecessary_lambdas

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
  gh.singletonAsync<_i3.Box<dynamic>>(() => registerModule.todoBox());
  gh.lazySingletonAsync<_i4.TodoBaseDataSource>(() async =>
      _i5.TodoLocalDataSource(hiveBox: await get.getAsync<_i3.Box<dynamic>>()));
  gh.lazySingletonAsync<_i6.TodoBaseRepository>(() async =>
      _i7.TodoRepository(await get.getAsync<_i4.TodoBaseDataSource>()));
  gh.lazySingletonAsync<_i8.AddNewTodoUsecase>(() async =>
      _i8.AddNewTodoUsecase(await get.getAsync<_i6.TodoBaseRepository>()));
  gh.lazySingletonAsync<_i9.FavoriteTodoUsecase>(() async =>
      _i9.FavoriteTodoUsecase(await get.getAsync<_i6.TodoBaseRepository>()));
  gh.lazySingletonAsync<_i8.FetchAllTodosUsecase>(() async =>
      _i8.FetchAllTodosUsecase(await get.getAsync<_i6.TodoBaseRepository>()));
  gh.singletonAsync<_i10.TodoCubit>(() async => _i10.TodoCubit(
        await get.getAsync<_i8.FetchAllTodosUsecase>(),
        await get.getAsync<_i8.AddNewTodoUsecase>(),
        await get.getAsync<_i9.FavoriteTodoUsecase>(),
      ));
  return get;
}

class _$RegisterModule extends _i11.RegisterModule {}
