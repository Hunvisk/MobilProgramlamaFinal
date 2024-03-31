// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../../core/responsive.dart';

class PlaceToVisit extends StatefulWidget {
  const PlaceToVisit({Key? key}) : super(key: key);

  @override
  State<PlaceToVisit> createState() => _PlacesState();
}

class _PlacesState extends State<PlaceToVisit> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return  gezilmekIstenenSayfa() ;
      case (Screen.tablet):
       return   Column(children: [Text("tablet modu")],);
      case (Screen.desktop):
       return Column(children: [Text("masaüstü modu")],) ;
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "GEZİLMEK İSTENİLENLER",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "GEZİLMEK İSTENİLENLER",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "GEZİLMEK İSTENİLENLER",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}
drawBottom(){
     switch (device) {
      case (Screen.mobile):
       return  MyBottomNavBar();
      case (Screen.tablet):
       return MyBottomNavBar();
      case (Screen.desktop):
       return ;
     }
   }



  @override
  Widget build(BuildContext context) {
     setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return Container(
        child: Scaffold(
      appBar: drawAppar(),
      body: drawScreen(),
      bottomNavigationBar: drawBottom(),
    ));
  }
}

class gezilmekIstenenSayfa extends StatelessWidget {
  const gezilmekIstenenSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("GEZİLMEK İSTENİLENLER SAYFASI");
  }
}
