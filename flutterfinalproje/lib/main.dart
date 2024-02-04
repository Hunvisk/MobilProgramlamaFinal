// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/routes.dart';
import 'package:flutterfinalproje/core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Final Proje',
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
      initialRoute: '/LogIn',
      themeMode: ThemeMode.light,
      theme: lightTheme,
      darkTheme: darkTheme,
    );
  }
}
