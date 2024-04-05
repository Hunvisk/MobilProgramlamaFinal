// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, library_private_types_in_public_api, prefer_const_constructors_in_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavBar extends StatefulWidget {
  MyBottomNavBar({Key? key, }) : super(key: key);

  @override
  _MyBottomNavBarState createState() => _MyBottomNavBarState();
}

class _MyBottomNavBarState extends State<MyBottomNavBar> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.push('/Home');
              },
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: () {
                context.push('/Places');
              },
              icon: Icon(Icons.location_on_sharp),
            ),
            IconButton(
              onPressed: () {
                context.push('/Map');
              },
              icon: Icon(Icons.map),
            ),
            IconButton(
              onPressed: () {
                context.push('/Routes');
              },
              icon: Icon(Icons.route),
            ),
          ],
        )
      ),
    );
  }
}
