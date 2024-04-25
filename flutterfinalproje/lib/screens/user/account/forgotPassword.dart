// ignore_for_file: sort_child_properties_last, deprecated_member_use, camel_case_types, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/user/account/desktopforgotPassword.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';


import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/account/tabletforgotpassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return passwordPage();
      case (Screen.tablet):
        return TabletForgotPassword();
      case (Screen.desktop):
        return DesktopForgotPassword();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("forgot_password")),
        );
      case (Screen.tablet):
        return AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("forgot_password")),
        );
      case (Screen.desktop):
        return AppBar(
          title: Text(AppLocalizations.of(context).getTranslate("forgot_password")),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MyAppBar(title: AppLocalizations.of(context).getTranslate("forgot_password"),),
        body: drawScreen(),
      ),
    );
  }
}

class passwordPage extends StatelessWidget {
  const passwordPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            AppLocalizations.of(context).getTranslate("forgot_password_title"),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
           Text(
            AppLocalizations.of(context).getTranslate("forgot_password_description"),
            style: TextStyle(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(10),
          SizedBox(
            height: 40, // TextField'ın yüksekliğini ayarını yaptım
            child: TextField(
              style: const TextStyle(fontSize: 14), // Metin boyutunu küçültmek için bu satır eklendi
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).getTranslate("email"),
                filled: false,
                fillColor: Theme.of(context).colorScheme.surface,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.black),
                ),
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(155, 154, 154, 1),
                ),
              ),
              cursorColor: Colors.black, // Yazma imleci rengi
            ),
          ),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              context.push('/');
            },
            child: Text(
              AppLocalizations.of(context).getTranslate("reset_password"),
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
