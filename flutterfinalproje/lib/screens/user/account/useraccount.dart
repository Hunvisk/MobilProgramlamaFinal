// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class UserAccount extends StatelessWidget {
  const UserAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'HESABIM',
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/CardsInfo');
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text(
                "KAYITLI KARTLARIM",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}
