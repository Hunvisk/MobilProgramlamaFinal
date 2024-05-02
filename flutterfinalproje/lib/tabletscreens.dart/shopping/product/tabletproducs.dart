// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';


class TabletProducts extends StatefulWidget {
  const TabletProducts({Key? key}) : super(key: key);

  @override
  State<TabletProducts> createState() => _TabletProductsState();
}

class _TabletProductsState extends State<TabletProducts> {

 
  

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: TabletProduct(),
    ));
  }
}

class TabletProduct extends StatelessWidget {
  const TabletProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

