import 'package:core/blocs/loads/base/bloc.dart';
import 'package:core/core.dart';
import 'package:core/di/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/scenes/home/home.dart';

void main() async {
  await initialCore();
  runApp(MobileApp());
}

class MobileApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoadBloc>(
            create: (context) => getIt.get(),
          )
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(title: 'Github Users'),
        ));
  }
}
