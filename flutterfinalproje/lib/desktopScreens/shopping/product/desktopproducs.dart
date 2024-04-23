// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';


class DesktopProducts extends StatefulWidget {
  const DesktopProducts({Key? key}) : super(key: key);

  @override
  State<DesktopProducts> createState() => _DesktopProductsState();
}

class _DesktopProductsState extends State<DesktopProducts> {

 
  

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      body: desktopProduct(),
    ));
  }
}

class desktopProduct extends StatelessWidget {
  const desktopProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("data");
  }
}

