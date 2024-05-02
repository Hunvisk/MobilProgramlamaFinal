// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  MyAppBar({Key? key, required this.title}) : super(key: key);

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
          GoRouter.of(context).pop(); // Geri butonuna basıldığında önceki sayfaya dönme işlemi
        },
      ),
      title: Center(
        child: Expanded(
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headlineSmall
          ),
        ),
      ),
      centerTitle: true, // Center the title
    );
  }
}

