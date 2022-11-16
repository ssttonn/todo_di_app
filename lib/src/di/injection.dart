import 'package:injectable/injectable.dart';
import '../../main.dart';
import 'injection.config.dart';

@InjectableInit()
Future<void> configureDependencies() async => await $initGetIt(getIt);
