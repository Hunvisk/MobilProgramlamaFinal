// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class UserComments extends StatelessWidget {
  const UserComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MyAppBar(title: 'Yorumlar',),
        body: Text("yorum page"),
        bottomNavigationBar: MyBottomNavBar(),
      )
    );
  }
}