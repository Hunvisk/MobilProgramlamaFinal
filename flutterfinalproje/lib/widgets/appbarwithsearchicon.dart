import 'package:flutter/material.dart';

class AppBarWithSearchIcon extends StatefulWidget implements PreferredSizeWidget  {
  final String title;
  final Icon icon;
  final Function(bool) onSearchChanged;

  const AppBarWithSearchIcon( 
    {
      Key? key,
      required this.title,
      required this.icon,
      required this.onSearchChanged,
    }
  ) :  super(key: key);
     @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
  @override
  _AppBarWithSearchIconState createState() => _AppBarWithSearchIconState();
}

class _AppBarWithSearchIconState extends State<AppBarWithSearchIcon> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;
  
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          size: 25,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context); // Geri butonuna basıldığında önceki sayfaya dönme işlemi
        },
      ),
      title: Center(

        child: Text(
          widget.title + (isSearching ? "" : "")
        )
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
              widget.onSearchChanged(isSearching);
            });
          },
        ),
      ],
    );
  }
}