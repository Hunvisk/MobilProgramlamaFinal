
// ignore_for_file: library_private_types_in_public_api

  import 'package:anim_search_bar/anim_search_bar.dart';
  import 'package:flutter/material.dart';

  class AppBarWithSearchIcon extends StatefulWidget
      implements PreferredSizeWidget {
    final String title;
    final Icon icon;
    final Function(bool) onSearchChanged;

    const AppBarWithSearchIcon({
      Key? key,
      required this.title,
      required this.icon,
      required this.onSearchChanged,
    }) : super(key: key);
    @override
    Size get preferredSize => const Size.fromHeight(kToolbarHeight);
    @override
    _AppBarWithSearchIconState createState() => _AppBarWithSearchIconState();
  }

  class _AppBarWithSearchIconState extends State<AppBarWithSearchIcon> {
    TextEditingController searchController = TextEditingController();
    bool isSearching = false;

    @override
    Widget build(BuildContext context) {
      return AppBar(
        title: Center(
          child: Expanded(
            child: Text(
              widget.title + (isSearching ? "" : ""),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          )
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
            color: Theme.of(context).colorScheme.background,
            boxShadow: false,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      );
    }
  }