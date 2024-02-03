// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

class Achievemets extends StatelessWidget {
  const Achievemets({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: MyAppBar(title: 'Achievemets',),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "İlk Gezim!", description: "İlk mekan gezini tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Seyahat Stajyeri", description: "25 mekan gezisi tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Kıdemli Gezgin", description: "50 mekan gezisi tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Uzman Gezgin", description: "100 mekan gezisi tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Gezi Kaşifi", description: "200 mekan gezini tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Bu da Benim Yolum.", description: "İlk rotanı oluşturdun."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Tavsiye mi Lazım?", description: "İlk blog yazını yazdın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Blog Editörü", description: "5 adet blog yazısı yazdın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Sevilen Blog Yazarı", description: "Bir blog yazın 500 beğeniye ulaşsın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Ben De Bir Gezginim.", description: "Üyeliği tamamla."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Sanırım Yardıma İhtiyacım Var.", description: "ChatBot ile iletişim kur."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Gezmenin yarısı istemektir!", description: "Gezilmek istenilenler alanına kaydetti..."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Başarım Avcısı", description: "Tüm başarımları tamamladın."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Bence...", description: "Bir mekan veya rota hakkında yorum..."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Bir de benim gözümden", description: "Bir fotoğraf yükledin."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Gezgin Albümü", description: "50 fotoğraf yükedin."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Her türden biraz...", description: "Bütün kategorilerden en az bir mekan..."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "Çok Yönlü Gezi", description: "En az 3 farklı kategoriden en az birer..."),
                        SizedBox(height: 15,),
                        AchievementsBox1(title: "İstanbul Gezgini", description: "İstanbul'un her semtinden birer mekan..."),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: MyBottomNavBar(),
      )
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
      height: 100,
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
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 8.0),
              child: Image.asset("assets/images/achievements/rozet.jpeg")
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
              child: Column(
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
            ),
          ],
        ),
      ),
    );
  }
}