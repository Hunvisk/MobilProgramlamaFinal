
// ignore_for_file: library_private_types_in_public_api

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';

import '../core/localizations.dart';

class MyHomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  //final String title;
  final Icon icon;
  final Function(bool) onSearchChanged;

  const MyHomeAppBar({
    Key? key,
    //required this.title,
    required this.icon,
    required this.onSearchChanged, required List<IconButton> actions,
  }) : super(key: key);


  


  @override
  _MyHomeAppBarState createState() => _MyHomeAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _MyHomeAppBarState extends State<MyHomeAppBar> {
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Expanded(
          child: Text(
            AppLocalizations.of(context).getTranslate("home_title"),
            maxLines: 1,
            overflow: TextOverflow.fade,
          ),
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
          prefixIcon: const Icon(Icons.search),
          suffixIcon: const Icon(Icons.search),
          helpText: "Search...",
          closeSearchOnSuffixTap: false,
          rtl: true,
          textFieldColor: Theme.of(context).secondaryHeaderColor,
          color: Theme.of(context).colorScheme.surface,
          boxShadow: false,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}