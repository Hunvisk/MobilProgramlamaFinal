import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
//import '../../widgets/mybottomnavbar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("notifications"),
      ),
      body: const SafeArea(
        child: Text("Bildirimler Sayfası")
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}