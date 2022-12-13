import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit(generateForDir: ["test"])
configureDependencies() => $initGetIt(getIt);

@module
abstract class ThirdPartyModuleRegistrar {
  @Named("BaseUrl")
  String get baseUrl => "https://63972c8986d04c76338d4b9b.mockapi.io/api";

  @Named("Headers")
  Map<String, dynamic> get headers => {
        HttpHeaders.contentTypeHeader: "application/json",
      };

  @lazySingleton
  Dio dioClient(@Named("BaseUrl") String url,
          @Named("Headers") Map<String, dynamic> headers) =>
      Dio(BaseOptions(baseUrl: url, headers: headers));

  @lazySingleton
  DioAdapter dioAdapter(@injectable Dio dio) => DioAdapter(dio: dio);
}
