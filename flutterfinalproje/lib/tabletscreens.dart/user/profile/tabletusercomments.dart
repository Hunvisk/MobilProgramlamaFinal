// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

class TabletUserComments extends StatelessWidget {
  const TabletUserComments({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'YORUMLAR',
      ),
      body: Text("YORUMLAR SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}

Column TabletUserCommentsScreen() {
  return Column(
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
    padding: EdgeInsets.all(20.0), // İçeriğin kenarlardan uzaklığı artırıldı
    decoration: BoxDecoration(
      color: Colors.grey.shade300,
      borderRadius: BorderRadius.circular(15),
    ),
    width: double.infinity, // Genişlik boyutunu maksimuma ayarlar
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.account_circle),
                Gap(15),
                Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18), // Başlık font boyutu artırıldı
                ),
              ],
            ),
          ],
        ),
        Gap(15),
        Text(
          content,
          style: TextStyle(fontSize: 16), // İçerik font boyutu artırıldı
        ),
        Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              location,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16, // Konum font boyutu artırıldı
              ),
            ),
            Text(
              date,
              style: TextStyle(fontSize: 14), // Tarih font boyutu artırıldı
            ),
          ],
        ),
      ],
    ),
  );
}
