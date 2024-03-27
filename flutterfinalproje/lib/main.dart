// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/client/client_cubit.dart';
import 'core/routes.dart';
import 'package:flutterfinalproje/core/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ClientCubit(
        ClientState(darkMode: false, language: "en")
      ),
      child: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Flutter Final Proje',
            debugShowCheckedModeBanner: false,
            routerConfig: routes,
            themeMode: ThemeMode.light,
            theme: darkTheme,
            darkTheme: darkTheme,
          );
        }
      ),
    );
  }
}
