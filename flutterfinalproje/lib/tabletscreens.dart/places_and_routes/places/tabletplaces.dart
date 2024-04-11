// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/responsive.dart';
import 'package:flutterfinalproje/widgets/myappbar.dart';
import 'package:flutterfinalproje/widgets/mybottomnavbar.dart';
import 'package:go_router/go_router.dart';

import '../../../widgets/placescontainerdesign.dart';

class TabletPlaces extends StatelessWidget {
  const TabletPlaces({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: MyAppBar(
        title: 'GEZİLMEK İSTENİLENLER',
      ),
      body: Text("GEZİLMEK İSTENİLENLER SAYFASI"),
      bottomNavigationBar: MyBottomNavBar(),
    ));
  }
}

class TabletPlacesScreen extends StatelessWidget {
  const TabletPlacesScreen({
    required this.device,
    required this.isSearching,
    required this.searchController,
  });

  final Screen device;
  final bool isSearching;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/SelectedPlaces');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PlacesContainerDesign(
                    imagePath: "assets/images/places/galata.jpg",
                    title: "Galata Kulesi",
                    rating: "8.5",
                    views: "1500",
                    comments: "45",
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/SelectedPlaces');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PlacesContainerDesign(
                    imagePath: "assets/images/places/kız.png",
                    title: "Kız Kulesi",
                    rating: "9.0",
                    views: "2000",
                    comments: "60",
                  ),
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/SelectedPlaces');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PlacesContainerDesign(
                    imagePath: "assets/images/places/dolmabahçe.jpg",
                    title: "Dolmabahçe Sarayı",
                    rating: "4.0",
                    views: "3000",
                    comments: "45",
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  GoRouter.of(context).push('/SelectedPlaces');
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: PlacesContainerDesign(
                    imagePath: "assets/images/places/dolmabahçe.jpg",
                    title: "Dolmabahçe Sarayı",
                    rating: "4.0",
                    views: "3000",
                    comments: "45",
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class FilterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.30,
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
                child: Text(
                  'Sırala',
                  style: TextStyle(color: Colors.white),
                ),
              ),
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
              width: MediaQuery.of(context).size.width * 0.30,
              height: MediaQuery.of(context).size.height * 0.05,
              child: ElevatedButton(
                onPressed: () {
                  // Show the custom sorting popup
                  _showSortPopup2(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                child: Text('Filtrele',
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
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
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Z- A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok yorum'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('En çok beğeni'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (artan)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Puanlama (azalan)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (A - Z)'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('Semte göre (Z - A)'),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Filtrele',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text('Z - A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text('A - Z'),
                  onTap: () {
                    GoRouter.of(context).pop();
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
