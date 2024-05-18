
import 'package:flutter/material.dart';
import 'package:flutterfinalproje/desktopScreens/places_and_routes/desktopmap.dart';

import '../../core/localizations.dart';
import '../../core/responsive.dart';
import '../../tabletscreens.dart/places_and_routes/tabletmap.dart';
import '../../widgets/myappbar.dart';

class MyMap extends StatefulWidget {
  const MyMap({Key? key}) : super(key: key);

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return  const HaritaBuild() ;
      case (Screen.tablet):
       return const TabletMap();
      case (Screen.desktop):
       return const DesktopMap();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return MyAppBar(
        title: AppLocalizations.of(context).getTranslate("map_title"),
      );
    case (Screen.tablet):
      return MyAppBar(
        title: AppLocalizations.of(context).getTranslate("map_title"),
      );
    case (Screen.desktop):
      return MyAppBar(
        title: AppLocalizations.of(context).getTranslate("map_title"),
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

class HaritaBuild extends StatelessWidget {
  const HaritaBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("HARİTALAR SAYFASI");
  }
}