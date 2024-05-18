import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';

class AddMailScreen extends StatefulWidget {
  const AddMailScreen({super.key});

  @override
  State<AddMailScreen> createState() => _AddMailScreenState();
}

class _AddMailScreenState extends State<AddMailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("email"),
      ),
      body: const SafeArea(
        child: Text("E-posta Sayfası")
      ),
    );
  }
}