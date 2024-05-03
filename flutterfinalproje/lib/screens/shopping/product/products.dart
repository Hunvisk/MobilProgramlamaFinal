// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../../desktopScreens/shopping/product/desktopproducs.dart';
import '../../../tabletscreens.dart/shopping/product/tabletproducs.dart';

class Products extends StatefulWidget {
  const Products({Key? key}) : super(key: key);

  @override
  State<Products> createState() => _PlacesState();
}

class _PlacesState extends State<Products> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return ProoductBody();
      case (Screen.tablet):
        return TabletProduct();
      case (Screen.desktop):
        return DesktopProduct();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
          icon: Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
    }
  }

  //drawBottom() {
  //  switch (device) {
  //    case (Screen.mobile):
  //      return MyBottomNavBar();
  //    case (Screen.tablet):
  //      return MyBottomNavBar();
  //    case (Screen.desktop):
  //      return;
  //  }
  //}

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Container(
        child: Scaffold(
      appBar: drawAppar(),
      body: drawScreen(),
      //bottomNavigationBar: drawBottom(),
    ));
  }
}

class ProoductBody extends StatelessWidget {
  const ProoductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("GEZGİN ÜRÜN SAYFASI");
  }
}
