import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../../main.dart';
import 'injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(getIt);
