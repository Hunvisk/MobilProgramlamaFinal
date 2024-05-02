import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
import '../../widgets/mybottomnavbar.dart';

class ThemeModeScreen extends StatefulWidget {
  const ThemeModeScreen({super.key});

  @override
  State<ThemeModeScreen> createState() => _ThemeModeScreenState();
}

class _ThemeModeScreenState extends State<ThemeModeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("screen"),
      ),
      body: const SafeArea(
        child: Text("Tema Modu Sayfası")
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}