// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';


class DesktopSelectedProducts extends StatefulWidget {
  const DesktopSelectedProducts({Key? key}) : super(key: key);

  @override
  State<DesktopSelectedProducts> createState() => DesktopSelectedProductsState();
}

class DesktopSelectedProductsState extends State<DesktopSelectedProducts> {

  
   

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: desktopSelectedProductsBody(),
      )
    );
  }
}

class desktopSelectedProductsBody extends StatelessWidget {
  const desktopSelectedProductsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("routes page");
  }
}