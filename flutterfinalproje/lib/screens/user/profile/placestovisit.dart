
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../core/responsive.dart';
import '../../../desktopScreens/user/profile/desktopplacestovisit.dart';
import '../../../tabletscreens.dart/user/profile/tabletplacestovisit.dart';
import '../../../widgets/myappbar.dart';
import '../../../widgets/placescontainerdesign.dart';
import '../../../widgets/routescontainerdesign.dart';

class PlaceToVisit extends StatefulWidget {
  const PlaceToVisit({Key? key}) : super(key: key);

  @override
  State<PlaceToVisit> createState() => _PlacesState();
}

class _PlacesState extends State<PlaceToVisit> {
  TextEditingController searchController = TextEditingController();
  bool isSearching = false;

  Screen device = Screen.mobile;

  drawScreen() {
    switch (device) {
      case (Screen.mobile):
        return GezilmekIstenenSayfa(
            device: device,
            isSearching: isSearching,
            searchController: searchController);
      case (Screen.tablet):
        return TabletPlacesToVisitScreen(
            device: device,
            isSearching: isSearching,
            searchController: searchController);
      case (Screen.desktop):
        return DesktopPlaceToVisitScreen(
            device: device,
            isSearching: isSearching,
            searchController: searchController);
    }
  }

  drawAppar() {
    switch (device) {
      case (Screen.mobile):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("places_to_visit"),
        );
      case (Screen.tablet):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("places_to_visit"),
        );
      case (Screen.desktop):
        return MyAppBar(
          title: AppLocalizations.of(context).getTranslate("places_to_visit"),
        );
    }
  }

  //drawBottom() {
  //  switch (device) {
  //    case (Screen.mobile):
  //      return MyBottomNavBar();
  //    case (Screen.tablet):
  //      return MyBottomNavBar();
  //    case (Screen.desktop):
  //      return;
  //  }
  //}

  @override
  Widget build(BuildContext context) {
    setState(() {
      device = detectScreen(MediaQuery.of(context).size);
    });
    return Scaffold(
          appBar: drawAppar(),
          body: drawScreen(),
        );
  }
}

class GezilmekIstenenSayfa extends StatelessWidget {
  const GezilmekIstenenSayfa({super.key, 
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
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: searchController,
              onChanged: (value) {},
              onSubmitted: (value) {},
              decoration: const InputDecoration(
                hintText: "Ara...",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.all(4.0),
              ),
            ),
          ),
        const FilterWidget(),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedPlaces');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
            child: PlacesContainerDesign(
              imagePath: "assets/images/places/galata.jpg",
              title: "Galata Kulesi",
              rating: "8.5",
              views: "1500",
              comments: "45",
            ),
          ),
        ),
        InkWell(
          onTap: () {
            GoRouter.of(context).push('/SelectedRoutes');
          },
          child: const Padding(
            padding: EdgeInsets.all(10.0),
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
      ],
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
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
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              child: Text(
                AppLocalizations.of(context).getTranslate("sort"),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          const VerticalDivider(
            color: Color.fromRGBO(0, 0, 0, 1),
            thickness: 4,
          ),
          const VerticalDivider(
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
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              child: Text(AppLocalizations.of(context).getTranslate("filter"),
                  style: const TextStyle(
                    color: Colors.white,
                  )),
            ),
          ),
        ],
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
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context).getTranslate("sort"),
                  style: const TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('A - Z'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Z- A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context).getTranslate("most_comments"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context).getTranslate("most_likes"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("scoring_ascending"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("scoring_descending"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_district_A-Z"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: Text(
                    AppLocalizations.of(context)
                        .getTranslate("by_district_Z-A"),
                  ),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
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
                    style: const TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                ListTile(
                  title: const Text('Z - A'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
                ListTile(
                  title: const Text('A - Z'),
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  trailing: const Icon(Icons.chevron_right),
                ),
                const Divider(),
              ],
            ),
          ),
        ),
      );
    },
  );
}
