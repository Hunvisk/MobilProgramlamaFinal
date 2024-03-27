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

    if (firstLaunch)
    {
    // cihazin gece gunduz moduna erismek
    const darkMode = ThemeMode.system == ThemeMode.dark; 

    // cihazin varsayilan diline erismek
    

      await storage.setConfig(language: getDeviceLanguage(), darkMode: darkMode);

      GoRouter.of(context).replace("/Boarding");
    }
    else
    {
      final config = await storage.setConfig();

      if (config["language"] == null) {
        storage.setConfig(language: getDeviceLanguage());
      }

      if (config["darkMode"] == null) {
        const darkMode = ThemeMode.system == ThemeMode.dark; 
        await storage.setConfig(darkMode: darkMode);
      }

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