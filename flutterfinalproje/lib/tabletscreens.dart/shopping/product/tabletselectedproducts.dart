// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';


class TabletSelectedProducts extends StatefulWidget {
  const TabletSelectedProducts({Key? key}) : super(key: key);

  @override
  State<TabletSelectedProducts> createState() => TabletSelectedProductsState();
}

class TabletSelectedProductsState extends State<TabletSelectedProducts> {

  
   

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: tabletSelectedProductsBody(),
      )
    );
  }
}

class tabletSelectedProductsBody extends StatelessWidget {
  const tabletSelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("routes page");
  }
}