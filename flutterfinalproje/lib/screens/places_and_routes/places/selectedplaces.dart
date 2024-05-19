import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';
import '../../../widgets/myappbar.dart';

class SelectedPlaces extends StatefulWidget {
  final Map<String, dynamic> place;

  const SelectedPlaces({Key? key, required this.place}) : super(key: key);

  @override
  State<SelectedPlaces> createState() => _SelectedPlacesState();
}

class _SelectedPlacesState extends State<SelectedPlaces> {
  // Seçilen resmin indisini tutacak değişken
  int _selectedImageIndex = 0;

  var comments = [
    {
      "id": 1,
      "name": "Emirhan Ceylan",
      "photo": "assets/images/logo/GR_Logo.png",
      "comment": "Müthiş bir yer! Kesinlikle ziyaret etmelisiniz.",
    },
    {
      "id": 2,
      "name": "Gülseren Zirek",
      "photo": "assets/images/logo/GR_Logo.png",
      "comment": "Müthiş bir yer! Kesinlikle ziyaret etmelisiniz.",
    },
    {
      "id": 3,
      "name": "İlknur Kavaklı",
      "photo": "assets/images/logo/GR_Logo.png",
      "comment": "Müthiş bir yer! Kesinlikle ziyaret etmelisiniz.",
    },
    {
      "id": 4,
      "name": "Talha Pamukcu",
      "photo": "assets/images/logo/GR_Logo.png",
      "comment": "Müthiş bir yer! Kesinlikle ziyaret etmelisiniz.",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate(widget.place["title"]),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      height: 350,
                      decoration: BoxDecoration(
                        color: Theme.of(context).secondaryHeaderColor,
                        border: Border.all(
                          width: 2,
                          color: Theme.of(context).secondaryHeaderColor,
                        ),
                      ),
                      child: Image.asset(
                        widget.place["images"][_selectedImageIndex],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: (widget.place["images"] as List<dynamic>).asMap().entries.map((entry) {
                              final int index = entry.key;
                              final String imagePath = entry.value;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _selectedImageIndex = index;
                                  });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: _selectedImageIndex == index
                                            ? Colors.blue // Seçilen resmin kenarlığı mavi olacak
                                            : Colors.transparent, // Seçilmeyen resimlerin kenarlığı şeffaf olacak
                                        width: 2.0,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(imagePath),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context).getTranslate(widget.place["title"]),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: (widget.place["description"] as List<dynamic>).map((desc) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        AppLocalizations.of(context).getTranslate(desc),
                        style: const TextStyle(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  infoRow(
                    context,
                    Icons.star,
                    widget.place["rating"].toString(),
                  ),
                  infoRow(
                    context,
                    Icons.remove_red_eye,
                    widget.place["views"].toString(),
                  ),
                  infoRow(
                    context,
                    Icons.comment,
                    widget.place["comments"].toString(),
                  ),
                ],
              ),
              const Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context).getTranslate("comments"),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: comments.length,
                itemBuilder: (context, index) => commentsBox(
                  context,
                  comments[index]["photo"].toString(),
                  comments[index]["name"].toString(),
                  comments[index]["comment"].toString(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentsBox(BuildContext context, String photo, String name, String comment) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Düzenleme: iç ve dış boşluklar
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).secondaryHeaderColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: CircleAvatar(
                  child: Image.asset(photo),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Gap(4),
                    Text(
                      comment,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoRow(BuildContext context, IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          const Gap(5),
          Text(
            text,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
