// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class DesktopAchievemets extends StatelessWidget {
  const DesktopAchievemets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'BAŞARIMLAR',
      ),
      body: Text("BAŞARIMLAR SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}

class DesktopAchievemetsScreen extends StatelessWidget {
  final List<Map<String, String>> achievements = [
    {"title": "İlk Gezim!", "description": "İlk mekan gezini tamamladın."},
    {"title": "Seyahat Stajyeri", "description": "25 mekan gezisi tamamladın."},
    {"title": "Kıdemli Gezgin", "description": "50 mekan gezisi tamamladın."},
    {"title": "Uzman Gezgin", "description": "100 mekan gezisi tamamladın."},
    {"title": "Gezi Kaşifi", "description": "200 mekan gezini tamamladın."},
    {"title": "Bu da Benim Yolum.", "description": "İlk rotanı oluşturdun."},
    {"title": "Tavsiye mi Lazım?", "description": "İlk blog yazını yazdın."},
    {"title": "Blog Editörü", "description": "5 adet blog yazısı yazdın."},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: achievements.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AchievementsBox1(
            title: achievements[index]['title']!,
            description: achievements[index]['description']!,
          ),
        );
      },
    );
  }
}

class AchievementsBox1 extends StatelessWidget {
  final String title;
  final String description;

  const AchievementsBox1({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.9),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        border: Border.all(
          width: 1,
          color: Colors.grey.shade300,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Image.asset("assets/images/achievements/rozet.jpeg"),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 17,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
