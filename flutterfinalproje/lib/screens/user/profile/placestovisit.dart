// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class PlaceToVisit extends StatelessWidget {
  const PlaceToVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MyAppBar(title: 'Gezilmek İstenilenler',),
        body: Text(" Gezilmek İstenilenler page"),
        bottomNavigationBar: MyBottomNavBar(),
      )
    );
  }
}