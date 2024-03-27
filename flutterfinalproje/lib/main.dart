// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'core/routes.dart';
import 'package:flutterfinalproje/core/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Final Proje',
      debugShowCheckedModeBanner: false,
      routerConfig: routes,
      themeMode: ThemeMode.light,
      theme: darkTheme,
      darkTheme: darkTheme,
    );
  }
}
