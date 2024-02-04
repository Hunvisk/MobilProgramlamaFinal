// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/widgets/appbarwithsearchicon.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:flutterfinalproje/widgets/placescontainerdesign.dart';

class Places extends StatefulWidget {
  const Places({Key? key}) : super(key: key);

  @override
  State<Places> createState() => _PlacesState();
}

class _PlacesState extends State<Places> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithSearchIcon(
        title: "MEKANLAR",
        icon: Icon(Icons.search),
        onSearchChanged: (isSearching) {
          setState(() {
            this.isSearching = isSearching;
          });
        },
      ),
      bottomNavigationBar: MyBottomNavBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (isSearching)
              Container(
                height: 32,
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  controller: searchController,
                  onChanged: (value) {},
                  onSubmitted: (value) {},
                  decoration: InputDecoration(
                    hintText: "Ara...",
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(4.0),
                  ),
                ),
              ),
            FilterWidget(),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/SelectedPlaces');
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: PlacesContainerDesign(
                  imagePath: "assets/images/places/galata.jpg",
                  title: "Galata Kulesi",
                  way: "8",
                  rating: "8.5",
                  views: "1500",
                  comments: "45",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PlacesContainerDesign(
                imagePath: "assets/images/places/kız.png",
                title: "Kız Kulesi",
                way: "12",
                rating: "9.0",
                views: "2000",
                comments: "60",
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: PlacesContainerDesign(
                imagePath: "assets/images/places/dolmabahçe.jpg",
                title: "Dolmabahçe Sarayı",
                way: "5",
                rating: "4.0",
                views: "3000",
                comments: "45",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        width: 350,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  _showSortPopup(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                child: Text('Sırala'),
              ),
            ),
            Container(
              height: 24,
              width: 3,
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.25,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  // Show the custom sorting popup
                  _showSortPopup2(context);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                child: Text('Filtrele'),
              ),
            ),
            Container(
              height: 24,
              width: 3,
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
            VerticalDivider(
              color: Color.fromRGBO(0, 0, 0, 1),
              thickness: 4,
            ),
          ],
        ),
      ),
    );
  }

  // Function to show the custom sorting popup
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
                  'Sırala',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('A - Z'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Z- A'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok yorum'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok beğeni'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (artan)'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (azalan)'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (A - Z)'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (Z - A)'),
                  onTap: () {
                    Navigator.pop(context);
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

void _showSortPopup2(BuildContext context) {
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
                Text(
                  'Filtrele',
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Z - A'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('A - Z'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  trailing: Icon(Icons.chevron_right),
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
