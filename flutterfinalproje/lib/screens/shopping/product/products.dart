// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'GEZGİN ÜRÜN',
      ),
      body: Text("GEZGİN ÜRÜN SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}
