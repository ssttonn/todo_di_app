// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:http_mock_adapter/http_mock_adapter.dart' as _i4;
import 'package:injectable/injectable.dart' as _i2;
import 'package:todo_app/src/features/todo_list/data/datasources/todo_remote_datasource.dart'
    as _i5;

import '../features/todo_list/data/datasources/todo_remote_datasource_test.dart'
    as _i6;
import 'injection.dart' as _i7; // ignore_for_file: unnecessary_lambdas

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
  gh.factory<Map<String, dynamic>>(
    () => thirdPartyModuleRegistrar.headers,
    instanceName: 'Headers',
  );
  gh.factory<String>(
    () => thirdPartyModuleRegistrar.baseUrl,
    instanceName: 'BaseUrl',
  );
  gh.lazySingleton<_i3.Dio>(() => thirdPartyModuleRegistrar.dioClient(
        get<String>(instanceName: 'BaseUrl'),
        get<Map<String, dynamic>>(instanceName: 'Headers'),
      ));
  gh.lazySingleton<_i4.DioAdapter>(
      () => thirdPartyModuleRegistrar.dioAdapter(get<_i3.Dio>()));
  gh.factory<_i5.BaseTodoRemoteDataSource>(
      () => _i6.MockTodoRemoteDataSource(dio: get<_i3.Dio>()));
  return get;
}

class _$ThirdPartyModuleRegistrar extends _i7.ThirdPartyModuleRegistrar {}
