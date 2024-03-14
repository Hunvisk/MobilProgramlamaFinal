// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final Icon icon;
  final Function(bool) onSearchChanged;

  const MyHomeAppBar({
    Key? key,
    required this.title,
    required this.icon,
    required this.onSearchChanged, required List<IconButton> actions,
  }) : super(key: key);


  


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
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      actions: [
        AnimSearchBar(
          width: MediaQuery.of(context).size.width, 
          textController: searchController, 
          onSuffixTap: () {}, 
          onSubmitted: (p0) {
            
          },
          autoFocus: true,
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.search),
          helpText: "Search...",
          closeSearchOnSuffixTap: false,
          rtl: true,
          textFieldColor: Theme.of(context).secondaryHeaderColor,
          color: Theme.of(context).backgroundColor,
          boxShadow: false,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}