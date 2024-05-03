import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
//import '../../widgets/mybottomnavbar.dart';

class AddPhoneNumberScreen extends StatefulWidget {
  const AddPhoneNumberScreen({super.key});

  @override
  State<AddPhoneNumberScreen> createState() => _AddPhoneNumberScreenState();
}

class _AddPhoneNumberScreenState extends State<AddPhoneNumberScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("phone_number"),
      ),
      body: const SafeArea(
        child: Text("Telefon Numarası Sayfası")
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }
}