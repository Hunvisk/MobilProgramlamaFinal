// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/localizations.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key, required this.child}) : super(key: key);

  final StatefulNavigationShell child;

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.child.currentIndex,
      onTap: ( value ) => _onItemTapped(value),
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home),
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context).getTranslate("home_title"),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.place_sharp),
          icon: Icon(Icons.place_sharp),
          label: AppLocalizations.of(context).getTranslate("places"),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.map),
          icon: Icon(Icons.map),
          label: AppLocalizations.of(context).getTranslate("map_title"),
        ),
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.route),
          icon: Icon(Icons.route),
          label: AppLocalizations.of(context).getTranslate("routes"),
        ),
      ],
    );
  }

  void _onItemTapped(int index) {
    widget.child.goBranch(
      index,
      initialLocation: index == widget.child.currentIndex
    );

  }
}
