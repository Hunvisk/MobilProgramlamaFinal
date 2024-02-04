// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(UserComments());
}

class UserComments extends StatelessWidget {
  final double boxWidth = 300; // Kutu genişliği
  final double boxHeight = 180; // Azaltılmış kutu yüksekliği

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyAppBar(title: 'YORUMLAR'),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'Beşiktaş',
                  '12/02/2023',
                ),
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'Kız Kulesi',
                  '11/04/2023',
                ),
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'Sarıyer',
                  '09/09/2023',
                ),
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'Kadıköy',
                  '14/08/2023',
                ),
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'Galata Kulesi',
                  '14/06/2023',
                ),
                Gap(10),
                buildColoredBox(
                  Color.fromARGB(255, 255, 229, 170),
                  'Eda Aydın',
                  'Çok güzel bir yerdi. Herkesin gitmesini öneririm.',
                  'İstinye',
                  '12/05/2023',
                ),
                Gap(10),
              ],
            ),
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      ),
    );
  }

  Widget buildColoredBox(
    Color color,
    String title,
    String content,
    String location,
    String date,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(15),
      ),
      padding: EdgeInsets.all(15.0), // İçeriğin kenarlardan uzaklığı
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.account_circle),
                  Gap(5),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
          Gap(5),
          Text(content),
          Gap(10),
          Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                location,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                date,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
