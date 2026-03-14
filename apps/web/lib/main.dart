import 'package:core/core.dart';
import 'package:core/settings/build_setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'bootstrap/app.dart';

void main() async {
  await initialCore();
  BuildSetting.initialize(ProdEnvironment());
  runApp(ProviderScope(child: WebApp()));
}
