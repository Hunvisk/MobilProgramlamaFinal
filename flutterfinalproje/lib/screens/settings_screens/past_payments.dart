import 'package:flutter/material.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
import '../../widgets/mybottomnavbar.dart';

class PastPaymentsScreen extends StatefulWidget {
  const PastPaymentsScreen({super.key});

  @override
  State<PastPaymentsScreen> createState() => _PastPaymentsScreenState();
}

class _PastPaymentsScreenState extends State<PastPaymentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("past_payments"),
      ),
      body: const SafeArea(
        child: Text("Geçmiş Ödemeler Sayfası")
      ),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}