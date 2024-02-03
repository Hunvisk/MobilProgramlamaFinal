// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Icon icon;

  const MyHomeAppBar(
    {
      Key? key, 
      required this.title,
      required this.icon,
    }
  ) : super(key: key);

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
      title: Center(
        child: Text(
          widget.title,
        ),
      ),
      actions: [
        IconButton(
          icon: widget.icon,
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