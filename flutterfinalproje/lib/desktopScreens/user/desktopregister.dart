// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, file_names, deprecated_member_use, camel_case_types, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, sort_child_properties_last, non_constant_identifier_names, avoid_web_libraries_in_flutter

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';


class DesktopRegister extends StatefulWidget {
  const DesktopRegister({Key? key}) : super(key: key);

  @override
  State<DesktopRegister> createState() => _DesktopRegisterState();
}

  class _DesktopRegisterState extends State<DesktopRegister> {

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

  Center DesktopRegister(BuildContext context) {
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
                "Kayıt Ol",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              Text(
                "Hala Hesabınız Yoksa Kayıt Olabilirsiniz.",
                style: TextStyle(
                  color: Color.fromRGBO(207, 206, 206, 1),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Text(
                "Kullanıcı Adı",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              Gap(2),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
                  ),
                  cursorColor: Colors.black, // Yazma imleci rengi
                ),
              ),

              Gap(2),
              Text(
                "E-Mail",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: 'E-Mail',
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
                        color: Colors.black,
                      ),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
                  ),
                  cursorColor: Colors.black,
                  obscureText: false,
                ),
              ),

              Gap(2),
              Text(
                "Şifre",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(155, 154, 154, 1)),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(155, 154, 154, 1),
                      ),
                    ),
                  ),
                  cursorColor: Colors.black,
                  obscureText: true,
                ),
              ),
              Gap(2),
              Text(
                " Tekrar Şifre",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(155, 154, 154, 1),
                ),
              ),
              Gap(5),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: TextField(
                  style: TextStyle(
                      backgroundColor: Color.fromRGBO(249, 249, 249, 1)),
                  decoration: InputDecoration(
                    labelText: ' Tekrar Şifre',
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    contentPadding: EdgeInsets.only(
                        top: 10.0, bottom: 10.0, left: 10.0, right: 5.0),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelStyle:
                        TextStyle(color: Color.fromRGBO(155, 154, 154, 1)),
                    suffixIcon: GestureDetector(
                      onTap: () {},
                      child: Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(155, 154, 154, 1),
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
              'Kayıt Ol',
              style: Theme.of(context).textTheme.button!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Theme.of(context).primaryColor, // Tema rengi, // Buton rengi
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
              'Zaten Bir Heabım Var ?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey, // Yazı rengi
              ),
            ),
            Gap(5),
            InkWell(
              onTap: () {
                context.push('/');
              },
              child: Text(
                'Oturum Aç',
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
}
