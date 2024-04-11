// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/responsive.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return ayarlarMenu() ;
      case (Screen.tablet):
       return   Column(
        children: [
          Text("tablet modu"), 
        ],
       ) ;
      case (Screen.desktop):
       return  Column(children: [
         Text("masaüstü modu"), 
        ],);
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "AYARLAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "AYARLAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "AYARLAR",icon: Icon(Icons.search),
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
      bottomNavigationBar: drawBottom()
    ));
  }
}

class ayarlarMenu extends StatelessWidget {
  const ayarlarMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("AYARLAR SAYFASI");
  }
}