import 'environment/enviroment.dart';

class BuildConfig {
  static Environment _environment;

  static initialize(Environment environment) {
    BuildConfig._environment = environment;
  }

  static String get baseUrl => _environment.baseUrl;
}
