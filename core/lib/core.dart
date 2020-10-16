library core;

import 'di/di.dart';

Future<void> initialCore() async {
  await configureDependencies();
}
