// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/places_and_routes/routes/desktoproutes.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:flutterfinalproje/widgets/routescontainerdesign.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/places_and_routes/routes/tabletroutes.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({Key? key}) : super(key: key);

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return routesSayfa(
            isSearching: isSearching, searchController: searchController);
      case (Screen.tablet):
        return TabletRoutesScreen(
            isSearching: isSearching, searchController: searchController);

      case (Screen.desktop):
        return DesktopRoutesScreen(
            isSearching: isSearching, searchController: searchController);
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("routes"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("routes"),
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("routes"),
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
        return SizedBox(); // Return an empty SizedBox for desktop
    }
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
      appBar: drawAppar(),
      bottomNavigationBar: drawBottom(),
      body: SingleChildScrollView(
        child: drawScreen(),
      ),
    );
  }
}

class routesSayfa extends StatelessWidget {
  const routesSayfa({
    Key? key,
    required this.isSearching,
    required this.searchController,
  }) : super(key: key);

  final bool isSearching;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (isSearching)
          Container(
            height: 32,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
              },
              onSubmitted: (value) {
                // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
              },
              decoration: InputDecoration(
                hintText: "Ara...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(4.0),
              ),
            ),
          ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoutesContainerDesign(
              photo: "assets/images/routes/eminonu.jpeg",
              title: "Eminönü",
              puan: "5.0",
              visualization: "2024",
              comment: "32",
              durak: "9",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoutesContainerDesign(
              photo: "assets/images/routes/ortakoy.jpeg",
              title: "Ortaköy",
              puan: "4.5",
              visualization: "1500",
              comment: "25",
              durak: "6",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoutesContainerDesign(
              photo: "assets/images/routes/sariyer.jpeg",
              title: "Sarıyer",
              puan: "4.7",
              visualization: "1800",
              comment: "28",
              durak: "12",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoutesContainerDesign(
              photo: "assets/images/routes/camlica.jpeg",
              title: "Çamlıca Tepesi",
              puan: "4.2",
              visualization: "3200",
              comment: "78",
              durak: "15",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: RoutesContainerDesign(
              photo: "assets/images/routes/kizKulesi.jpeg",
              title: "Kız Kulesi",
              puan: "3.9",
              visualization: "1293",
              comment: "22",
              durak: "3",
            ),
          ),
        ),
      ],
    );
  }
}
