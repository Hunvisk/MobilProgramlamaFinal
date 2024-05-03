import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/localizations.dart';

class AboutAppScreen extends StatefulWidget {
  const AboutAppScreen({super.key});

  @override
  State<AboutAppScreen> createState() => _AboutAppScreenState();
}

class _AboutAppScreenState extends State<AboutAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("about_app"),
      ),
      body: const SafeArea(
        child: Text("Uygulama Hakkında Sayfası")
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}