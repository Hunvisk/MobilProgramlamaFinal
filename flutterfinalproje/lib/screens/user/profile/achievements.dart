// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/screens/places_and_routes/places/selectedplaces.dart';
import 'package:flutterfinalproje/screens/user/profile/userblogs.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/responsive.dart';

class Achievemets extends StatefulWidget {
  const Achievemets({Key? key}) : super(key: key);

  @override
  _AchievementsState createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievemets> {
  Screen device = Screen.mobile;
  
  set isSearching(bool isSearching) {}

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   basarimlarSayfa();
      case (Screen.tablet):
       return   blogsScr();
      case (Screen.desktop):
       return  selectedPlac();
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "BAŞARIMLAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "BAŞARIMLAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "BAŞARIMLAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
  }
}
drawBottom(){
     switch (device) {
      case (Screen.mobile):
       return  MyBottomNavBar();
      case (Screen.tablet):
       return MyBottomNavBar();
      case (Screen.desktop):
       return ;
     }
   }

  @override
  Widget build(BuildContext context) {
      setState(() {
        device = detectScreen(MediaQuery.of(context).size);
      });
    return Container(
        child: Scaffold(
      appBar: drawAppar(),
      body: SafeArea(
        child: drawScreen(),
      ),
      bottomNavigationBar: drawBottom(),
    ));
  }
}

class basarimlarSayfa extends StatelessWidget {
  const basarimlarSayfa({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Gap(15),
                  AchievementsBox1(
                      title: "İlk Gezim!",
                      description: "İlk mekan gezini tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Seyahat Stajyeri",
                      description: "25 mekan gezisi tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Kıdemli Gezgin",
                      description: "50 mekan gezisi tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Uzman Gezgin",
                      description: "100 mekan gezisi tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Gezi Kaşifi",
                      description: "200 mekan gezini tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Bu da Benim Yolum.",
                      description: "İlk rotanı oluşturdun."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Tavsiye mi Lazım?",
                      description: "İlk blog yazını yazdın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Blog Editörü",
                      description: "5 adet blog yazısı yazdın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Sevilen Blog Yazarı",
                      description: "Bir blog yazın 500 beğeniye ulaşsın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Ben De Bir Gezginim.",
                      description: "Üyeliği tamamla."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Sanırım Yardıma İhtiyacım Var.",
                      description: "ChatBot ile iletişim kur."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Gezmenin yarısı istemektir!",
                      description:
                          "Gezilmek istenilenler alanına kaydetti..."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Başarım Avcısı",
                      description: "Tüm başarımları tamamladın."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Bence...",
                      description: "Bir mekan veya rota hakkında yorum..."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Bir de benim gözümden",
                      description: "Bir fotoğraf yükledin."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Gezgin Albümü",
                      description: "50 fotoğraf yükedin."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Her türden biraz...",
                      description:
                          "Bütün kategorilerden en az bir mekan..."),
                  Gap(15),
                  AchievementsBox1(
                      title: "Çok Yönlü Gezi",
                      description:
                          "En az 3 farklı kategoriden en az birer..."),
                  Gap(15),
                  AchievementsBox1(
                      title: "İstanbul Gezgini",
                      description: "İstanbul'un her semtinden birer mekan"),
                ],
              ),
            ),
          ),
        )
      ],
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
                padding: const EdgeInsets.only(
                    top: 5.0, bottom: 5.0, left: 5.0, right: 8.0),
                child: Image.asset("assets/images/achievements/rozet.jpeg")),
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
