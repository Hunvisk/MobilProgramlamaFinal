// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';

//import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/shopping/product/desktop_selected_products.dart';

class SelectedProducts extends StatefulWidget {
  const SelectedProducts({Key? key}) : super(key: key);

  @override
  State<SelectedProducts> createState() => _SelectedProductsState();
}

class _SelectedProductsState extends State<SelectedProducts> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   SelectedProductsBody();
      case (Screen.tablet):
       return  ;

      case (Screen.desktop):
       return DesktopSelectedProductsBody() ;
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}
//drawBottom(){
//     switch (device) {
//      case (Screen.mobile):
//       return  MyBottomNavBar();
//      case (Screen.tablet):
//       return MyBottomNavBar();
//      case (Screen.desktop):
//       return ;
//     }
//   }

  @override
  Widget build(BuildContext context) {
    setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return Container(
      child: Scaffold(
        body: SelectedProductsBody(),
      )
    );
  }
}

class SelectedProductsBody extends StatelessWidget {
  const SelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("routes page");
  }
}