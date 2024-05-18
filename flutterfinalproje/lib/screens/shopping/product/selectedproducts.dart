
import 'package:flutter/material.dart';

import '../../../core/responsive.dart';
import '../../../desktopScreens/shopping/product/desktop_selected_products.dart';
import '../../../widgets/appbarwithsearchicon.dart';

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
       return   const SelectedProductsBody();
      case (Screen.tablet):
       return  ;

      case (Screen.desktop):
       return const DesktopSelectedProductsBody() ;
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",
        icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "SEÇİLEN ÜRÜNLER",icon: const Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}

  @override
  Widget build(BuildContext context) {
    setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return const Scaffold(
      body: SelectedProductsBody(),
    );
  }
}

class SelectedProductsBody extends StatelessWidget {
  const SelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text("routes page");
  }
}