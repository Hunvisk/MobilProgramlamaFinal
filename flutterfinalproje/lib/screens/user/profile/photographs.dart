// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/user/profile/desktopphotographs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/profile/tabletphotographs.dart';

class Photographs extends StatefulWidget {
  const Photographs({Key? key}) : super(key: key);

  @override
  State<Photographs> createState() => PhotographsState();
}

class PhotographsState extends State<Photographs> {
  bool isSearching = false;
  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return FotografSayfa();
      case (Screen.tablet):
        return TabletPhotographsScreen();
      case (Screen.desktop):
        return DesktopPhotographsScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("fotos"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("fotos"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("fotos"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

  drawBottom() {
    switch (device) {
      case (Screen.mobile):
        return MyBottomNavBar();
      case (Screen.tablet):
        return MyBottomNavBar();
      case (Screen.desktop):
        return;
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
        appBar: drawAppar(),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: drawScreen(),
        ),
      ),
    );
  }

  Column FotografSayfa() {
    return Column(
      children: [
        Divider(thickness: 3),
        FilterWidget(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PhotoItem(AppLocalizations.of(context).getTranslate("camera"),
                  "1.151", "assets/images/photographs/anlatan_meydanı.jpeg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("collage"),
                  "2.345", "assets/images/photographs/yalvac.jpg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("flowers"),
                  "3.789", "assets/images/photographs/isparta.jpg"),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PhotoItem(AppLocalizations.of(context).getTranslate("animals"),
                  "1.151", "assets/images/photographs/yalvac.jpg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("family"),
                  "2.345", "assets/images/photographs/isparta.jpg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("facebook"),
                  "3.789", "assets/images/photographs/cinaralti.jpeg"),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PhotoItem(AppLocalizations.of(context).getTranslate("whatsApp"),
                  "1.151", "assets/images/photographs/pisidia.jpeg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("snapchat"),
                  "2.345", "assets/images/photographs/yalvac.jpg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("instagram"),
                  "3.789", "assets/images/photographs/isparta.jpg"),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PhotoItem(AppLocalizations.of(context).getTranslate("camera"),
                  "1.151", "assets/images/photographs/isparta.jpg"),
              PhotoItem(AppLocalizations.of(context).getTranslate("snapchat"),
                  "2.345", "assets/images/photographs/cinaralti.jpeg"),
              PhotoItem(
                  AppLocalizations.of(context).getTranslate("screen_shootlar"),
                  "3.789",
                  "assets/images/photographs/yalvac.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget PhotoItem(String title, String count, String photo) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineMedium!.color,
              fontWeight:
                  Theme.of(context).textTheme.headlineMedium!.fontWeight,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
            ),
          ),
        ],
      ),
    );
  }

  void _showAlbumPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      AppLocalizations.of(context).getTranslate("albums"),
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _showSortPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppLocalizations.of(context).getTranslate("albums"),
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ), // Arama ikonu
                      onPressed: () {
                        // Arama ikonuna tıklandığında yapılacak işlemler
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSortPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate("albums"),
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_year_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_year_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_month_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_month_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_day_(oldest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_day_(newest)"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
