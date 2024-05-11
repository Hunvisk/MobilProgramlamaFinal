// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/user/profile/desktopcomments.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/profile/tabletusercomments.dart';

void main() {
  runApp(UserComments());
}

class UserComments extends StatefulWidget {
  const UserComments({Key? key}) : super(key: key);

  @override
  _UserCommentsState createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  Screen device = Screen.mobile;
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde 0.5 saniye sonra görünürlüğü değiştir
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  drawScreen() {
    switch (device) {
      case Screen.mobile:
        return yorumSayfa();
      case Screen.tablet:
        return tabletUserCommentsScreen();
      case Screen.desktop:
        return desktopUserCommentsScreen();
    }
  }

  drawAppBar() {
    return AppBarWithSearchIcon(
      title: AppLocalizations.of(context).getTranslate("Comments"),
      icon: Icon(Icons.search),
      onSearchChanged: (isSearching) {
        setState(() {
          // Handle search state changes here
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return SafeArea(
      child: Scaffold(
        appBar: drawAppBar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isVisible ? 0.0 : 1.0, // Silik hali
                ),
                Gap(10),
                AnimatedOpacity(
                  duration: const Duration(milliseconds: 500),
                  opacity: isVisible ? 1.0 : 0.0, // Görünür hali
                  child:
                      yorumSayfa(), // Doğrudan yorumSayfa metodu kullanılıyor
                ),
                Gap(10),
              ],
            ),
          ),
        ),
        // bottomNavigationBar: drawBottom(),
      ),
    );
  }

  Column yorumSayfa() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Beşiktaş',
          date: '12/02/2023',
        ),
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Kız Kulesi',
          date: '11/04/2023',
        ),
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Sarıyer',
          date: '09/09/2023',
        ),
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Kadıköy',
          date: '14/08/2023',
        ),
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'Galata Kulesi',
          date: '14/06/2023',
        ),
        Gap(10),
        buildColoredBox(
          color: Colors.grey.shade300,
          title: 'Eda Aydın',
          content: AppLocalizations.of(context).getTranslate("comments_text"),
          location: 'İstinye',
          date: '12/05/2023',
        ),
        Gap(10),
      ],
    );
  }
}

class buildColoredBox extends StatefulWidget {
  final String title;
  final String location;
  final Color color;
  final String content;
  final String date;

  const buildColoredBox({
    required this.title,
    required this.location,
    required this.color,
    required this.content,
    required this.date,
    Key? key,
  }) : super(key: key);

  @override
  State<buildColoredBox> createState() => _buildColoredBoxState();
}

class _buildColoredBoxState extends State<buildColoredBox> {
  bool isVisible = false;

  @override
  void initState() {
    super.initState();
    // Sayfa yüklendiğinde 0.5 saniye sonra görünürlüğü değiştir
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isVisible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 0.0 : 1.0, // Silik hali
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color.withOpacity(0.5),
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          AnimatedOpacity(
            duration: const Duration(milliseconds: 500),
            opacity: isVisible ? 1.0 : 0.0, // Görünür hali
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  border: Border.all(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.all(15.0), // İçeriğin kenarlardan uzaklığı
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.account_circle,),
                                Gap(5),
                                Text(
                                  widget.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors
                                        .black, // Metin rengini siyah olarak ayarla
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Gap(5),
                        Text(
                          widget.content,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors
                                .black, // Metin rengini siyah olarak ayarla
                          ),
                        ),
                        Gap(5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.location,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black, // Metin rengini siyah olarak ayarla
                              ),
                            ),
                            Text(
                              widget.date,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors
                                    .black, // Metin rengini siyah olarak ayarla
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
