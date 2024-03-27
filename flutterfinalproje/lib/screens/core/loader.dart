// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/storage.dart';


class LoaderScreen extends StatefulWidget {
  const LoaderScreen({super.key});

  @override
  State<LoaderScreen> createState() => _LoaderScreenState();
}

class _LoaderScreenState extends State<LoaderScreen> {
  loadApp() async {
  final storage = Storage();
  final firstLaunch = await storage.isFirstLaunch();

  if (firstLaunch) {
    // cihazın gece gündüz moduna erişmek
    final darkMode = ThemeMode.system == ThemeMode.dark;

    // cihazın varsayılan diline erişmek
    final language = getDeviceLanguage();

    await storage.setConfig(language: language, darkMode: darkMode);

    GoRouter.of(context).replace("/Boarding");
  } else {
    final config = await storage.setConfig();

    final language = config?["language"] ?? getDeviceLanguage();
    final darkMode = config?["darkMode"] ?? (ThemeMode.system == ThemeMode.dark);

    await storage.setConfig(language: language, darkMode: darkMode);

    GoRouter.of(context).replace("/Home");
  }
}


  getDeviceLanguage() {
    final String defaultLocale;

    if (!kIsWeb) {
      defaultLocale = 
        Platform.localeName;
    }
    else {
      defaultLocale = "en";
    }

      final langParts = defaultLocale.split("_");
      
      final supportedLanguages = ["en", "tr", "de"];

      final String finalLang;

      if (supportedLanguages.contains(langParts[0])) {
        finalLang = langParts[0];
      }
      else {
        finalLang = "en";
      }

      return finalLang;
  }

  @override
  void initState()
  {
    super.initState();
    loadApp();
  }

  @override
  Widget build(BuildContext context)
  {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}