// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/responsive.dart';

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
       return  haritaBuild() ;
      case (Screen.tablet):
       return   Column(
        children: [
          Text("Tablet Modu"), 
        ],
       ) ;
      case (Screen.desktop):
       return  Column(children: [
         Text("Masaüstü Modu"), 
        ],);
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "HARİTALAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "HARİTALAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "HARİTALAR",icon: Icon(Icons.search),
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
      ),
    );
  }
}

class haritaBuild extends StatelessWidget {
  const haritaBuild({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("HARİTALAR SAYFASI");
  }
}