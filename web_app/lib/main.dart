import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:web_app/scenes/home/home.dart';

void main() async {
  await initialCore();
  runApp(WebApp());
}

class WebApp extends StatelessWidget {
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
