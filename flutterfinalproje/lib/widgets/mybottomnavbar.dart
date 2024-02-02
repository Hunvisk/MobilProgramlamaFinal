// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key, }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {
  int selectedIndex = 0;
  final List<String> rotaAdlari = ['/Home', '/Places', '/Map', '/Routes'];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Container(
        height: 35,
        child: GNav(
          gap: 10,
          color: Colors.grey,
          activeColor: Colors.grey,
          //tabBackgroundColor: Colors.grey.shade400,
          onTabChange: (index) {
            if (selectedIndex != index) {
              setState(() {
                selectedIndex = index;
              });
      
              // Şu anki sayfayı kontrol et
              String currentRoute = ModalRoute.of(context)!.settings.name!;
              if (currentRoute != rotaAdlari[index]) {
                Navigator.pushNamed(context, rotaAdlari[index]);
                print('Selected Index: $selectedIndex');
              }
            }
          },
          padding: EdgeInsets.all(15),
          tabs: [
            GButton(
              icon: Icons.home,
              //text: 'Ana Sayfa',
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
            GButton(
              icon: Icons.place,
              //text: 'Mekanlar',
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
            GButton(
              icon: Icons.map,
              //text: 'Harita',
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
            GButton(
              icon: Icons.route,
              //text: 'Rotalar',
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
            ),
          ],
          selectedIndex: selectedIndex,
        ),
      ),
    );
  }
}
