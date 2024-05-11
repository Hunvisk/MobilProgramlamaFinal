import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:gap/gap.dart';

import '../../../core/localizations.dart';

class SelectedPlaces extends StatefulWidget {
  const SelectedPlaces({Key? key}) : super(key: key);

  @override
  State<SelectedPlaces> createState() => _SelectedPlacesState();
}

class _SelectedPlacesState extends State<SelectedPlaces> {
  // Seçilen resmin indisini tutacak değişken
  int _selectedImageIndex = 0;

  // Küçük resimlerin listesi
  final List<String> _smallImages = [
    "assets/images/places/dolmabahçe.jpg",
    "assets/images/places/galata.jpg",
    "assets/images/places/kız.png",
    "assets/images/photographs/anlatan_meydanı.jpeg",
    "assets/images/photographs/cinaralti.jpeg",
    "assets/images/photographs/isparta.jpg",
    "assets/images/photographs/pisidia.jpeg",
    "assets/images/photographs/yalvac.jpg",
  ];

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
      appBar: MyAppBar(title: "Selected Places"),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack( // Stack ekledik
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
                      _smallImages[_selectedImageIndex],
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
                          children: _smallImages.asMap().entries.map((entry) {
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
                AppLocalizations.of(context).getTranslate("boarding_title-4"),
                style: const TextStyle(fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10, bottom: 10),
              child: Text(
                AppLocalizations.of(context).getTranslate("boarding_description-4"),
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                infoRow(
                  context,
                  Icons.star,
                  "8.5",
                ),
                infoRow(
                  context,
                  Icons.remove_red_eye,
                  "123456",
                ),
                infoRow(
                  context,
                  Icons.comment,
                  "123456",
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
            Expanded( // ListView için genişlemiş alan
              child: ListView.builder(
                itemCount: comments.length,
                itemBuilder: (context, index) => commentsBox(
                  context,
                  comments[index]["photo"].toString(),
                  comments[index]["name"].toString(),
                  comments[index]["comment"].toString(),
                ),                    
              ),
            ),
          ],
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

