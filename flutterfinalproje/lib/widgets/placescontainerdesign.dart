
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
          child: SizedBox(
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
          child: titleAndBookmark(widget.title),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: infoColumns(widget.rating, widget.views, widget.comments),
        ),
      ],
    );
  }

  Widget titleAndBookmark(String title) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.3),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                maxLines: 1,
                overflow: TextOverflow.fade,
                style: const TextStyle(
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

  Widget infoColumns(String rating, String views, String comments) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(8.0),
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

}

class InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const InfoRow(
    {
      super.key, 
      required this.icon,
      required this.text,
    }
  );

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
          const Gap(5),
          Text(
            text,
            style: const TextStyle(
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
