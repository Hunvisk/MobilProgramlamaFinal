import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../widgets/myappbar.dart';
//import '../../widgets/mybottomnavbar.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("settings"),
      ),
      body: Column(
        children: [
          settingsItem(context, '/ThemeMode', 'screen'),
          const Divider(),
          settingsItem(context, '/Change_LanguageScreen', 'language'),
          const Divider(),
          settingsItem(context, '/Permissions', 'permissions'),
          const Divider(),
          settingsItem(context, '/Notifications', 'notifications'),
          const Divider(),
          settingsItem(context, '/AboutApp', 'about_app'),
          const Divider(),
          settingsItem(context, '/Home', 'payment_methods'), // Ödeme Yöntemleri sayfası yönlendirme eklenecek. ( İlknur'a not )
          const Divider(),
          settingsItem(context, '/PastPayments', 'past_payments'),
          const Divider(),
          settingsItem(context, '/AddMail', 'email'),
          const Divider(),
          settingsItem(context, '/AddPhoneNumber', 'phone_number'),
          const Divider(),
        ],
      ),
      //bottomNavigationBar: MyBottomNavBar(),
    );
  }

  InkWell settingsItem(BuildContext context, String route, String title, ) {
    return InkWell(
          onTap: () {
            context.push(route);
          },
          child: ListTile(
          title: Text(
            AppLocalizations.of(context).getTranslate(title),
            style: const TextStyle(
              fontFamily:'poppions', // Her iki yerde de aynı yazı tipini kullanmak için 'poppions' kullanıldı   
            ),
          ),
          trailing:
            const Icon(
              Icons.arrow_forward_ios, 
              color: Colors.grey
            ),
          ),
        );
  }
}
