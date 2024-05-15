// ignore_for_file: deprecated_member_use

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
        return const PasswordPage();
      case (Screen.tablet):
        return const TabletForgotPassword();
      case (Screen.desktop):
        return const DesktopForgotPassword();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBar(
          title: Text(
              AppLocalizations.of(context).getTranslate("forgot_password")),
        );
      case (Screen.tablet):
        return AppBar(
          title: Text(
              AppLocalizations.of(context).getTranslate("forgot_password")),
        );
      case (Screen.desktop):
        return AppBar(
          title: Text(
              AppLocalizations.of(context).getTranslate("forgot_password")),
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
        appBar: MyAppBar(
          title: AppLocalizations.of(context).getTranslate("forgot_password"),
        ),
        body: drawScreen(),
      ),
    );
  }
}

class PasswordPage extends StatelessWidget {
  const PasswordPage({
    super.key,
  });

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            AppLocalizations.of(context)
                .getTranslate("password_change_request_title"),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)
                    .getTranslate("password_change_request_has_been_received"),
              ),
              const Gap(8),
              Text(
                AppLocalizations.of(context)
                    .getTranslate("check_your_mail_account"),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                context.push('/Login');
              },
              child: Text(
                AppLocalizations.of(context).getTranslate("sign_in"),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).getTranslate("forgot_password_title"),
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Gap(10),
          Text(
            AppLocalizations.of(context)
                .getTranslate("forgot_password_description"),
            style: const TextStyle(
              fontSize: 13,
            ),
            textAlign: TextAlign.center,
          ),
          const Gap(10),
          SizedBox(
            height: 45, // TextField'ın yüksekliğini ayarını yaptım
            child: TextField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)
                    .getTranslate("forgot_password"),
                filled: true,
                fillColor: Theme.of(context).secondaryHeaderColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.only(
                    top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                ),
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
              cursorColor: Colors.black, // Yazma imleci rengi
            ),
          ),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              _showSuccessDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Text(
              AppLocalizations.of(context).getTranslate("reset_password"),
              style: Theme.of(context).textTheme.button!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
