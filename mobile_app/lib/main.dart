import 'package:core/config/app/build_config.dart';
import 'package:core/config/app/environment/prod_environment.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/scenes/home/home.dart';

void main() async {
  await initialCore();
  BuildConfig.initialize(new ProdEnvironment());
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Github Users'),
    );
  }
}
