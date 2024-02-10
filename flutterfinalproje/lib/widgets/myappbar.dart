// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const MyAppBar({super.key, required this.title});

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 25,
          color: Theme.of(context).primaryColor,
        ),
        onPressed: () {
          Navigator.pop(context); // Geri butonuna basıldığında önceki sayfaya dönme işlemi
        },
      ),
      title: Center(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall
        ),
      ),
      centerTitle: true, // Center the title
    );
  }
}
