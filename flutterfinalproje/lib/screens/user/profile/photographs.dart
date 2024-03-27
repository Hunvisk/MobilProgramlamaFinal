// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, unused_element

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:go_router/go_router.dart';


class Photographs extends StatefulWidget {
  const Photographs({Key? key}) : super(key: key);

  @override
  State<Photographs> createState() => PhotographsState();
}

class PhotographsState extends State<Photographs> {
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: MyAppBar(
          title: 'FOTOĞRAFLAR',
        ),
        body: SingleChildScrollView(scrollDirection:Axis.vertical ,
          child: Column(
            children: [
              Divider(thickness: 3),
              FilterWidget(),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotoItem("Kamera", "1.151", "assets/images/photographs/anlatan_meydanı.jpeg"),
                    PhotoItem("Kolaj", "2.345", "assets/images/photographs/yalvac.jpg"),
                    PhotoItem("Çiçekler", "3.789", "assets/images/photographs/isparta.jpg"),
                  ],
                ),
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotoItem("Hayvanlar", "1.151", "assets/images/photographs/yalvac.jpg"),
                    PhotoItem("Aile", "2.345", "assets/images/photographs/isparta.jpg"),
                    PhotoItem("Facebook", "3.789", "assets/images/photographs/cinaralti.jpeg"),
                  ],
                ),
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotoItem("WhatsApp", "1.151", "assets/images/photographs/pisidia.jpeg"),
                    PhotoItem("Snapchat", "2.345", "assets/images/photographs/yalvac.jpg"),
                    PhotoItem("Instagram", "3.789", "assets/images/photographs/isparta.jpg"),
                  ],
                ),
              ),
              SingleChildScrollView(scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    PhotoItem("ScreenShootlar", "1.151", "assets/images/photographs/isparta.jpg"),
                    PhotoItem("Snapchat", "2.345", "assets/images/photographs/cinaralti.jpeg"),
                    PhotoItem("Instagram", "3.789", "assets/images/photographs/yalvac.jpg"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget PhotoItem(String title, String count, String photo) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                photo,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).textTheme.headlineMedium!.color,
              fontWeight: Theme.of(context).textTheme.headlineMedium!.fontWeight,
            ),
          ),
          Text(
            count,
            style: TextStyle(
              fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
              fontWeight: Theme.of(context).textTheme.bodySmall!.fontWeight,
            ),
          ),
        ],
      ),
    );
  }

  void _showAlbumPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Album',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                height: MediaQuery.of(context).size.height * 0.05,
                child: ElevatedButton(
                  onPressed: () {
                    _showSortPopup(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    textStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 21,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Albümler',
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.search,
                        size: 30,
                      ), // Arama ikonu
                      onPressed: () {
                        // Arama ikonuna tıklandığında yapılacak işlemler
                      },
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

  void _showSortPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Albüm',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Yıla Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Yıla Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Aya Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Aya Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Güne Göre (En Eski)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Güne Göre (En Yeni)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
