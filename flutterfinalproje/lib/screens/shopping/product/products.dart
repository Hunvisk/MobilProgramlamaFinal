
import 'package:flutter/material.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/shopping/product/desktopproducs.dart';
import '../../../tabletscreens.dart/shopping/product/tabletproducs.dart';
import '../../../widgets/appbarwithsearchicon.dart';

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
        return const ProoductBody();
      case (Screen.tablet):
        return const TabletProduct();
      case (Screen.desktop):
        return const DesktopProduct();
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.tablet):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        );
      case (Screen.desktop):
        return AppBarWithSearchIcon(
          title: "HARİTALAR",
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
    return Scaffold(
          appBar: drawAppar(),
          body: drawScreen(),
        );
  }
}

class ProoductBody extends StatelessWidget {
  const ProoductBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("GEZGİN ÜRÜN SAYFASI");
  }
}
