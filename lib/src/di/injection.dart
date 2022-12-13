import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import '../../main.dart';
import 'injection.config.dart';

@InjectableInit(generateForDir: ["lib"])
configureDependencies() => $initGetIt(getIt);

@module
abstract class ThirdPartyModuleRegistrar {
  @Named("BaseUrl")
  String get baseUrl => "https://63972c8986d04c76338d4b9b.mockapi.io/api";

  @lazySingleton
  Dio dioClient(@Named("BaseUrl") String url) => Dio(BaseOptions(baseUrl: url));
}
