import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutterfinalproje/core/localizations.dart';

import 'bloc/client/client_cubit.dart';
import 'bloc/saved_places/saved_places_cubit.dart';
import 'bloc/saved_routes/saved_routes_cubit.dart';
import 'core/routes.dart';
import 'core/theme.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override 
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClientCubit(
            ClientState(darkMode: false, language: "en")
          ),
        ),
        BlocProvider(
          create: (context) => SavedPlacesCubit(
            SavedPlacesState(savedPlaces: [])
          ),
        ),
        BlocProvider(
          create: (context) => SavedRoutesCubit(
            SavedRoutesState(savedRoutes: [])
          ),
        ),
      ],
      child: BlocBuilder<ClientCubit, ClientState>(
        builder: (context, state) {
          return MaterialApp.router(
            title: 'Gezginin Rotası',
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
              Locale('fr', 'FR'),
              Locale('es', 'ES'),
            ],
            locale: Locale(state.language),
          );
        }
      ),
    );  
  }
}