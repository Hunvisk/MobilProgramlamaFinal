
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../desktopScreens/user/desktopregister.dart';
import '../../tabletscreens.dart/user/tabletregister.dart';
import '../../widgets/appbarwithsearchicon.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  bool obscureTextPassword = true;
  bool obscureTextPasswordAgain = true;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return registerScreen(context);
      case (Screen.tablet):
        return const TabletRegister();

      case (Screen.desktop):
        return const DesktopRegister();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("register"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("register"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("register"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
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

  Center registerScreen(BuildContext context) {
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
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              Text(
                AppLocalizations.of(context)
                    .getTranslate("do_not_have_an_account"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Text(
                AppLocalizations.of(context).getTranslate("username"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const Gap(2),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context).getTranslate("username"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                ),
              ),

              const Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("email"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context).getTranslate("email"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
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

              const Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("password"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: const TextStyle(),
                  decoration: InputDecoration(
                    labelText:
                        AppLocalizations.of(context).getTranslate("password"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Şifrenin görünürlüğünü tersine çevirme
                          obscureTextPassword = !obscureTextPassword;
                        });
                      },
                      child: Icon(
                        // Şifre görünürse göz simgesini görünmez yap
                        obscureTextPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                  obscureText: obscureTextPassword, // Şifrenin görünürlüğü
                ),
              ),

              const Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("password_again"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context)
                        .getTranslate("password_again"),
                    filled: true,
                    fillColor: Theme.of(context).secondaryHeaderColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary),
                    ),
                    labelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          // Şifrenin görünürlüğünü tersine çevirme
                          obscureTextPasswordAgain = !obscureTextPasswordAgain;
                        });
                      },
                      child: Icon(
                        // Şifre görünürse göz simgesini görünmez yap
                        obscureTextPasswordAgain
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                  obscureText: obscureTextPasswordAgain,
                ),
              ),

              signInButton(context),
              const Gap(2), // Boşluk ekledik
              otherSignInText(context),
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

Widget signInButton(BuildContext context) {
  return Column(
    children: [
      const Gap(15),
      Container(
        width: double.infinity,
        margin: const EdgeInsets.all(5),
        child: ElevatedButton(
          onPressed: () {
            context.push('/Login');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor:
                Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: Text(
            AppLocalizations.of(context).getTranslate("register"),
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    ],
  );
}

Widget otherSignInText(
  BuildContext context,
) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppLocalizations.of(context)
                .getTranslate("already_have_an_account"),
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary, // Yazı rengi
            ),
          ),
          const Gap(5),
          InkWell(
            onTap: () {
              context.push('/Login');
            },
            child: Text(
              AppLocalizations.of(context).getTranslate("sign_in"),
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
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
