// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterfinalproje/core/localizations.dart';
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
            themeMode: state.darkMode ? ThemeMode.dark : ThemeMode.light,
            theme: lightTheme,
            darkTheme: darkTheme,
            localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('tr', 'TR'),
            Locale('de', 'DE'),
            Locale('ru', 'RU'),
          ],
          locale: Locale(state.language),
          );
        }
      ),
    );
  }
}
