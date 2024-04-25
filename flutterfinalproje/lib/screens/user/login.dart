// ignore_for_file: camel_case_types, prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables, sort_child_properties_last, empty_statements,  non_constant_identifier_names, deprecated_member_use, avoid_print, unused_import, use_build_context_synchronously
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutterfinalproje/desktopScreens/user/desktoplogin.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../tabletscreens.dart/user/tabletlogin.dart';

void main() {
  runApp(LoginScreen());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return buildColumn(context);
      case (Screen.tablet):
        return TabletLogin();
      case (Screen.desktop):
        return DesktopLogin();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("sign_in"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("sign_in"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("sign_in"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

  instagram() {
    final Uri uri = Uri.parse("https://www.instagram.com");
    launchUrl(uri);
  }

  apple() {
    final Uri uri = Uri.parse("https://www.apple.com");
    launchUrl(uri);
  }

  google() {
    final Uri uri = Uri.parse("https://www.google.com");
    launchUrl(uri);
  }

  linkedin() {
    final Uri uri = Uri.parse("https://www.linkedin.com");
    launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: SingleChildScrollView(
              child: drawScreen(),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Logo(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("sign_in"),
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Text(
                AppLocalizations.of(context)
                    .getTranslate("continue_app_description"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(20),
              Text(
                AppLocalizations.of(context).getTranslate("email"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context).getTranslate("email"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                ),
              ),
              Gap(6),
              Text(
                AppLocalizations.of(context).getTranslate("password"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      //backgroundColor: Color.fromRGBO(249, 249, 249, 1),
                      ),
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context).getTranslate("password"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.primary
                        ),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                  obscureText:
                      true, // Bu satır, şifrenin görünürlüğünü kontrol eder
                ),
              ),
              SignInLink(context), // "Şifremi Unuttum" linki
              SignInButton(context),
              Gap(10), // Boşluk ekledik
              OtherSignInText(context), // "Diğer Giriş" metni
              Gap(10), // Boşluk ekledik
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: instagram,
                      child: SvgPicture.asset(
                        "assets/icons/instagram.svg",
                        height: 35,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: apple,
                      child: SvgPicture.asset(
                        "assets/icons/apple.svg",
                        height: 35,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: google,
                      child: SvgPicture.asset(
                        "assets/icons/google.svg",
                        height: 35,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: linkedin,
                      child: SvgPicture.asset(
                        "assets/icons/linkedin.svg",
                        height: 35,
                        color:Theme.of(context).colorScheme.primary
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget Logo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/images/login/login.jpg",
            ),
          ),
        ],
      ),
    );
  }
}

Widget SignInLink(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          context.push('/ForgotPassword');
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 1),
          child: Text(
            AppLocalizations.of(context).getTranslate("forgot_password"),
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ),
  );
}

Widget SignInButton(BuildContext context) {
  return Container(
    width: double.infinity,
    margin: EdgeInsets.all(5),
    child: ElevatedButton(
      onPressed: () {
        context.push('/Home');
      },
      child: Text(
        AppLocalizations.of(context).getTranslate("sign_in"),
        style: Theme.of(context).textTheme.button!.copyWith(
            fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor:
             Theme.of(context).colorScheme.primary, // Tema rengi, // Buton rengi
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    ),
  );
}

Widget OtherSignInText(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).getTranslate("have_an_account"),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary // Yazı rengi
            ),
          ),
          Gap(5),
          InkWell(
            onTap: () {
              context.push('/Register');
            },
            child: Text(
              AppLocalizations.of(context).getTranslate("register"),
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
