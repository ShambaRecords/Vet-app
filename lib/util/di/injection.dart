import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vet_app/util/di/injection.config.dart';

final getIt = GetIt.instance;

@injectableInit
void configureInjection(String env) =>
    $initGetIt(getIt, environment: env);

abstract class Env {
  static const dev = "DEV";
  static const test = "TEST";
  static const staging = "STAG";
  static const prod = "PROD";
}

