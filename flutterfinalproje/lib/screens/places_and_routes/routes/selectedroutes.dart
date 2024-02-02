// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class SelectedRoutes extends StatelessWidget {
  const SelectedRoutes({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MyAppBar(title: 'Routes',),
        body: Text("routes page"),
        bottomNavigationBar: MyBottomNavBar(),
      )
    );
  }
}