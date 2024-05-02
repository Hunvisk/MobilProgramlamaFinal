// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutterfinalproje/core/responsive.dart';

import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../widgets/placescontainerdesign.dart';
import '../../../widgets/routescontainerdesign.dart';

class DesktopPlaceToVisit extends StatelessWidget {
  const DesktopPlaceToVisit({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
    ));
  }
}

class DesktopPlaceToVisitScreen extends StatelessWidget {
  const DesktopPlaceToVisitScreen({
    Key? key,
    required this.device,
    required this.isSearching,
    required this.searchController,
  }) : super(key: key);

  final Screen device;
  final bool isSearching;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    GoRouter.of(context).push('/SelectedRoutes');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: RoutesContainerDesign(
                      photo: "assets/images/routes/eminonu.jpeg",
                      title: "Eminönü",
                      puan: "5.0",
                      visualization: "2024",
                      comment: "32",
                      durak: "9",
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
                      imagePath: "assets/images/places/galata.jpg",
                      title: "Galata Kulesi",
                      rating: "8.5",
                      views: "1500",
                      comments: "45",
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.45,
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
                  AppLocalizations.of(context).getTranslate("sort"),
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
              width: MediaQuery.of(context).size.width * 0.45,
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
                child: Text(AppLocalizations.of(context).getTranslate("filter"),
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
                  AppLocalizations.of(context).getTranslate("sort"),
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
                  title: Text(
                    AppLocalizations.of(context).getTranslate("most_comments"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context).getTranslate("most_likes"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("scoring_ascending"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("scoring_descending"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_district_A-Z"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: Icon(Icons.chevron_right),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_district_Z-A"),
                  ),
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
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    AppLocalizations.of(context).getTranslate("filter"),
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
