import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyBottomNavBar extends StatelessWidget {
  final String currentPath;
  const MyBottomNavBar({super.key, required this.currentPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              context.go("/Home");
            }, 
            icon: Icon(
              Icons.home,
              color: currentPath == "/Home" ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/Places");
            }, 
            icon: Icon(
              Icons.place_sharp,
              color: currentPath == "/Places" ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/Map");
            }, 
            icon: Icon(
              Icons.map,
              color: currentPath == "/Map" ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground,
            ),
          ),
          IconButton(
            onPressed: () {
              context.go("/Routes");
            }, 
            icon: Icon(
              Icons.route,
              color: currentPath == "/Routes" ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.onBackground,
            ),
          ),
        ],
      ),
    );
  }
}