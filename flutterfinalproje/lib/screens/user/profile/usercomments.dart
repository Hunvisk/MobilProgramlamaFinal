// ignore_for_file: file_names, use_key_in_widget_constructors, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:gap/gap.dart';

import '../../../core/responsive.dart';
import '../../../tabletscreens.dart/user/profile/tabletusercomments.dart';

void main() {
  runApp(UserComments());
}
class UserComments extends StatefulWidget {
  const UserComments({Key? key}) : super(key: key);

  @override
  _UserCommentsState createState() => _UserCommentsState();
}

class _UserCommentsState extends State<UserComments> {
  Screen device = Screen.mobile;
  final double boxWidth = 300; // Kutu genişliği
  final double boxHeight = 180;
  
  set isSearching(bool isSearching) {} // Azaltılmış kutu yüksekliği
drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   yorumSayfa();
      case (Screen.tablet):
       return TabletUserCommentsScreen();
      case (Screen.desktop):
       return   Column(children: [Text("masaüstü modu")],);
     }
   }

   drawAppar() {
  switch (device) {
    case (Screen.mobile):
      return AppBarWithSearchIcon(title: "YORUMLAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.tablet):
      return AppBarWithSearchIcon(title: "YORUMLAR",icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },);
    case (Screen.desktop):
      return AppBarWithSearchIcon(title: "YORUMLAR",icon: Icon(Icons.search),
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
    return SafeArea(
      child: Scaffold(
        appBar: drawAppar(),
        body: SafeArea(
          child: SingleChildScrollView(
            child: drawScreen(),
          ),
        ),
        bottomNavigationBar: drawBottom(),
      ),
    );
  }

  Column yorumSayfa() {
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
