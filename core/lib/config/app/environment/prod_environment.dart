import 'enviroment.dart';

class ProdEnvironment extends Environment {
  @override
  String get baseUrl => "https://api.github.com";
}
