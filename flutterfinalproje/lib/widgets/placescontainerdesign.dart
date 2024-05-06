// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlacesContainerDesign extends StatefulWidget {
  final String imagePath;
  final String title;
  final String rating;
  final String views;
  final String comments;

  const PlacesContainerDesign({
    super.key,
    required this.imagePath,
    required this.title,
    required this.rating,
    required this.views,
    required this.comments,
  });

  @override
  State<PlacesContainerDesign> createState() => _PlacesContainerDesignState();
}

class _PlacesContainerDesignState extends State<PlacesContainerDesign> {
  bool isBookmarked = false;
  Color iconColor = Colors.white;
  bool isGezilmekIstenilenChecked = false;
  bool isDigerChecked = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 250,
            width: double.infinity,
            child: Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: TitleAndBookmark(widget.title),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: InfoColumns(widget.rating, widget.views, widget.comments),
        ),
      ],
    );
  }

  Widget TitleAndBookmark(String title) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_outline,
                color: iconColor,
              ),
              onPressed: () {
                setState(() {
                  isBookmarked = !isBookmarked;
                  iconColor = isBookmarked ? Colors.white : Colors.white;
                  if (isBookmarked) {
                    
                  }
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget InfoColumns(String rating, String views, String comments) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoRow(
            icon: Icons.star,
            text: ": $rating",
          ),
          InfoRow(
            icon: Icons.remove_red_eye,
            text: ": $views",
          ),
          InfoRow(
            icon: Icons.comment,
            text: ": $comments",
          ),
        ],
      ),
    );
  }

  void _showSavePopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: Text("Kaydedilenler"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: isGezilmekIstenilenChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isGezilmekIstenilenChecked = newValue ?? false;
                          });
                        },
                        checkColor: Colors.white, // Checkbox işaret rengi
                        activeColor: Colors.blue, // Checkbox aktif rengi
                      ),
                      Text("Gezilmek İstenilen Yerler"),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isDigerChecked,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isDigerChecked = newValue ?? false;
                          });
                        },
                        checkColor: Colors.white, // Checkbox işaret rengi
                        activeColor: Colors.blue, // Checkbox aktif rengi
                      ),
                      Text("Mekanlar"),
                    ],
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('İptal'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Tamam'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 20,
          ),
          Gap(5),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
