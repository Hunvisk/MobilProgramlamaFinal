// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class PlacesContainerDesign extends StatelessWidget {

  final String imagePath;
  final String title;
  final String way;
  final String rating;
  final String views;
  final String comments;

  const PlacesContainerDesign(
    {
      super.key,
      required this.imagePath,
      required this.title,
      required this.way,
      required this.rating,
      required this.views,
      required this.comments,
    }
  );

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
              imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: TitleAndBookmark(title),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: InfoColumns(way, rating, views, comments), 
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
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              onPressed: () {
              },
            ),
          ],
        ),
      ),
    );
  }

Widget InfoColumns(String way, String rating, String views, String comments) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(
                icon: Icons.directions_bus, 
                text: ": $way", 
              ),
              InfoRow(
                icon: Icons.star,
                text:  ": $rating",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
        ],
      ),
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