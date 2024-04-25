// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, deprecated_member_use, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/user/desktopregister.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../tabletscreens.dart/user/tabletregister.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

  class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return  RegisterScreen(context) ;
      case (Screen.tablet):
       return  TabletRegister();

      case (Screen.desktop):
       return  DesktopRegister();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: AppLocalizations.of(context).getTranslate("register"),
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: AppLocalizations.of(context).getTranslate("register"),icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: AppLocalizations.of(context).getTranslate("register"),icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
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
          body: drawScreen(),
        ),
      ),
    );
  }

  Center RegisterScreen(BuildContext context) {
    return Center(
          child: SingleChildScrollView(
            child: buildColumn(context),
          ),
        );
  }

  Widget buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        logo(),
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("register"),
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                AppLocalizations.of(context).getTranslate("do_not_have_an_account"),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Text(
                AppLocalizations.of(context).getTranslate("username"),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Gap(2),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("username"),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
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

              Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("email"),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("email"),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  cursorColor: Colors.black,
                  obscureText: false,
                ),
              ),

              Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("password"),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("password"),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
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
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  obscureText: true,
                ),
              ),
              Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("password_again"),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText:AppLocalizations.of(context).getTranslate("password_again"),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
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
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  obscureText: true,
                ),
              ),
              SignInButton(context),
              Gap(2), // Boşluk ekledik
              OtherSignInText(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget logo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Image.asset(
              "assets/images/register/register.jpg",
            ),
          ),
        ],
      ),
    );
  }
}

Widget SignInButton(BuildContext context) {
  return Column(
    children: [
      Gap(15),
      Container(
        width: double.infinity,
        margin: EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            context.push('/');
          },
          child: Text(
            AppLocalizations.of(context).getTranslate("register"),
            style: Theme.of(context).textTheme.button!.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget OtherSignInText(
  BuildContext context,
) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context).getTranslate("already_have_an_account"),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary, // Yazı rengi
            ),
          ),
          Gap(5),
          InkWell(
            onTap: () {
              context.push('/');
            },
            child: Text(
              AppLocalizations.of(context).getTranslate("sign_in"),
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