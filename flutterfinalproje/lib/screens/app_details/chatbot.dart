// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';

import '../../core/responsive.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({Key? key}) : super(key: key);

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {

  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

   Screen device = Screen.mobile;

   drawScreen(){
     switch (device) {
      case (Screen.mobile):
       return   chatBotMenu();
      case (Screen.tablet):
       return   Column(
        children: [
          Text("Tablet Modu"), 
        ],
       ) ;
      case (Screen.desktop):
       return  Column(children: [
         Text("Masaüstü Modu"), 
        ],);
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
      appBar:MyAppBar(title: 'ChatBot',),
      body: drawScreen(),
      bottomNavigationBar: drawBottom(),
    ));
  }
}

class chatBotMenu extends StatelessWidget {
  const chatBotMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text("CHATBOT SAYFASI");
  }
}