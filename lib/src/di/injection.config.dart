// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/todo_list/data/datasources/todo_remote_datasource.dart'
    as _i4;
import '../features/todo_list/data/repositories/todo_repository.dart' as _i5;
import '../features/todo_list/domain/usecases/todo_usecases.dart' as _i6;
import '../features/todo_list/presentation/blocs/todo_list/todo_list_bloc.dart'
    as _i7;
import 'injection.dart' as _i8; // ignore_for_file: unnecessary_lambdas

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
  final thirdPartyModuleRegistrar = _$ThirdPartyModuleRegistrar();
  gh.factory<String>(
    () => thirdPartyModuleRegistrar.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(() => thirdPartyModuleRegistrar
      .dioClient(get<String>(instanceName: 'BaseUrl')));
  gh.factory<_i4.BaseTodoRemoteDataSource>(
      () => _i4.TodoRemoteDataSource(dioClient: get<_i3.Dio>()));
  gh.factory<_i5.TodoRepository>(
      () => _i5.TodoRepositoryImpl(get<_i4.BaseTodoRemoteDataSource>()));
  gh.factory<_i6.UpdateTodoUsecase>(
      () => _i6.UpdateTodoUsecase(get<_i5.TodoRepository>()));
  gh.factory<_i6.AddNewTodoUsecase>(
      () => _i6.AddNewTodoUsecase(get<_i5.TodoRepository>()));
  gh.factory<_i6.DeleteTodoUsecase>(
      () => _i6.DeleteTodoUsecase(get<_i5.TodoRepository>()));
  gh.factory<_i6.FetchAllTodosUsecase>(
      () => _i6.FetchAllTodosUsecase(get<_i5.TodoRepository>()));
  gh.factory<_i7.TodoListBloc>(() => _i7.TodoListBloc(
        get<_i6.FetchAllTodosUsecase>(),
        get<_i6.UpdateTodoUsecase>(),
        get<_i6.AddNewTodoUsecase>(),
      ));
  return get;
}

class _$ThirdPartyModuleRegistrar extends _i8.ThirdPartyModuleRegistrar {}
