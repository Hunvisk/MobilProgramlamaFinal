// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class RoutesContainerDesign extends StatelessWidget {

  final String photo;
  final String title;
  final String puan;
  final String visualization;
  final String comment;
  final String durak;

  const RoutesContainerDesign(
    {
      super.key,
      required this.photo,
      required this.title,
      required this.puan,
      required this.visualization,
      required this.comment,
      required this.durak,
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
              photo,
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
          child: InfoColumns(puan, visualization, comment, durak), // Durak sayısı ekleniyor
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
                // Kaydet ikonuna tıklanınca yapılacak işlem
              },
            ),
          ],
        ),
      ),
    );
  }

Widget InfoColumns(String puan, String visualization, String comment, String durak) {
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
                icon: Icons.directions_bus, // Durak ikonu
                text: ": $durak", // Durak sayısı
              ),
              InfoRow(
                icon: Icons.star,
                text:  ": $puan",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoRow(
                icon: Icons.remove_red_eye,
                text: ": $visualization",
              ),
              InfoRow(
                icon: Icons.comment,
                text: ": $comment",
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