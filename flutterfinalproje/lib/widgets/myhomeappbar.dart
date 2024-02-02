// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _MyHomeAppBarState createState() => _MyHomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MyHomeAppBarState extends State<MyHomeAppBar> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: isSearching
          ? TextField(
              controller: searchController,
              onChanged: (value) {
                // Arama çubuğu değiştiğinde yapılacak işlemleri ekleyin.
              },
              onSubmitted: (value) {
                // Arama çubuğundan 'Submit' tuşuna basıldığında yapılacak işlemleri ekleyin.
              },
              decoration: InputDecoration(
                hintText: "Ara...",
                border: InputBorder.none,
              ),
            )
          : Center(
              child: Text("ANA SAYFA"),
            ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              isSearching = !isSearching;
              if (!isSearching) {
                searchController.clear();
              }
            });
          },
        ),
      ],
    );
  }
}
