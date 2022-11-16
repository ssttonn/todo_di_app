import 'package:injectable/injectable.dart';
import '../../main.dart';
import 'injection.config.dart';

@InjectableInit()
configureDependencies() => $initGetIt(getIt);
