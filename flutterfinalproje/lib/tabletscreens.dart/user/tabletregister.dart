
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../core/localizations.dart';

class TabletRegister extends StatefulWidget {
  const TabletRegister({Key? key}) : super(key: key);

  @override
  State<TabletRegister> createState() => _TabletRegisterState();
}

class _TabletRegisterState extends State<TabletRegister> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: logo()),
                  Expanded(child: buildColumn(context)),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Center tabletRegister(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: buildColumn(context),
      ),
    );
  }

  Widget logo() {
    return Align(
      alignment: Alignment.topCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 300,
            height: 300,
            child: Image.asset(
              "assets/images/register/register.jpg",
            ),
          ),
        ],
      ),
    );
  }

  Widget buildColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("register"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              Text(
                AppLocalizations.of(context).getTranslate("do_not_have_an_account"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  color: Color.fromRGBO(207, 206, 206, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(10),
              Text(
                AppLocalizations.of(context).getTranslate("username"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              const Gap(2),
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
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    labelStyle:
                        const TextStyle(
                          //color: Color.fromRGBO(155, 154, 154, 1)
                        ),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                ),
              ),

              const Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("email"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: const TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("email"),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: const EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        color: Colors.black,
                      ),
                    ),
                    labelStyle:
                        const TextStyle(
                          
                        ),
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
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: const TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("password"),
                    filled: true,
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
                    labelStyle:
                        const TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(155, 154, 154, 1),
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  obscureText: true,
                ),
              ),
              const Gap(2),
              Text(
                AppLocalizations.of(context).getTranslate("password_again"),
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(155, 154, 154, 1),
                ),
              ),
              const Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: const TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).getTranslate("password_again"),
                    filled: true,
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
                    labelStyle:
                        const TextStyle(
                          
                        ),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(155, 154, 154, 1),
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  obscureText: true,
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
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
              AppLocalizations.of(context).getTranslate("already_have_an_account"),
              maxLines: 1,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey, // Yazı rengi
              ),
            ),
            const Gap(5),
            InkWell(
              onTap: () {
                context.push('/Home');
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
}
