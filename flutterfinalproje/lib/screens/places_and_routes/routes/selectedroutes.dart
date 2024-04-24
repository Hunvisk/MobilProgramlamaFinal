// ignore_for_file: file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, sized_box_for_whitespace, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/places_and_routes/routes/desktopselectedroutes.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/places_and_routes/routes/tabletselectedroutes.dart';
import '../../product/Cart.dart';

void main() {
  runApp(SelectedRoutes());
}

class SelectedRoutes extends StatefulWidget {
  const SelectedRoutes({Key? key}) : super(key: key);

  @override
  _SelectedRoutesState createState() => _SelectedRoutesState();
}

class _SelectedRoutesState extends State<SelectedRoutes> {
  Screen device = Screen.mobile;

  set isSearching(bool isSearching) {}

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return selectedRoute();
      case (Screen.tablet):
        return TabletSelectedRoutesScreen();
      case (Screen.desktop):
        return DesktopSelectedRoutesScreen();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("selected_routes"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("selected_routes"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("selected_routes"),
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
        appBar: drawAppar(),
        body: SingleChildScrollView(
          child: drawScreen(),
        ),
        bottomNavigationBar: drawBottom(),
      ),
    );
  }
}

class selectedRoute extends StatelessWidget {
  const selectedRoute({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Container(
                height: 350,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6),
                    bottomRight: Radius.circular(50),
                  ), // Kenarların ovalleşme miktarını belirleyin
                  child: Image.asset(
                    'assets/images/routes/eminonu.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10, // İkinci resmin yükseklik konumu
                right: 30, // İkinci resmin yatay konumu
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/routes/eminonu.jpeg',
                      fit: BoxFit.cover,
                      width: 100, // İkinci resmin genişliği
                      height: 90, // İkinci resmin yüksekliği
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 120,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/routes/eminonu.jpeg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 90,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 240,
                right: 30,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/images/routes/eminonu.jpeg',
                      fit: BoxFit.cover,
                      width: 100,
                      height: 90,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context).getTranslate("explanation"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                AppLocalizations.of(context).getTranslate("eminonu_text"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppions',
                  fontSize: 13,
                ),
              ),
              Gap(5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalizations.of(context).getTranslate("place"),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppions',
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "Fatih",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'poppions',
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        size: 15,
                      ),
                      Gap(3),
                      Text(
                        "5.600",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppions',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                      ),
                      Icon(
                        Icons.star,
                        size: 10,
                      ),
                      Text(
                        "5.0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppions',
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                AppLocalizations.of(context).getTranslate("comments"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'poppions',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
        Gap(6),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 22,
                    ),
                    Text(
                      "İlknur Kavaklı",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                Gap(5),
                Row(
                  children: [
                    Text(
                      AppLocalizations.of(context).getTranslate("comment_content"),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "50",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.mode_comment,
                      size: 18,
                    ),
                    Gap(7),
                    Text(
                      "50",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppions',
                        fontSize: 15,
                      ),
                    ),
                    Icon(
                      Icons.favorite_border,
                      size: 18,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
