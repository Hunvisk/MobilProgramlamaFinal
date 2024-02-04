// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class Photographs extends StatelessWidget {
  const Photographs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'FOTOĞRAFLAR',
      ),
      body: Text("FOTOĞRAFLAR SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}
