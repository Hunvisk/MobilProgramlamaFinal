import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterfinalproje/bloc/saved_routes/saved_routes_cubit.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../widgets/appbarwithsearchicon.dart';

class RoutesScreen extends StatefulWidget {
  const RoutesScreen({super.key});

  @override
  State<RoutesScreen> createState() => _RoutesScreenState();
}

class _RoutesScreenState extends State<RoutesScreen> {
  bool isSearching = false;
  late List<dynamic> routes = [];

  late SavedRoutesCubit savedRoutesCubit;

  @override
  void initState() {
    super.initState();
    savedRoutesCubit = context.read<SavedRoutesCubit>();
    loadRoutes();
  }

  Future<void> loadRoutes() async {
    // JSON dosyasını oku
    String jsonString = await rootBundle.loadString('assets/data/routes.json');
    // JSON verisini parse et
    List<dynamic> jsonList = json.decode(jsonString);
    // State'i güncelle ve verileri atama
    setState(() {
      routes = jsonList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("routes"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        ),
        body: BlocBuilder<SavedRoutesCubit, SavedRoutesState>(
          builder: (context, state) {
            return Column( // Column ekliyorum
              children: [
                const FilterWidget(), // FilterWidget eklendi
                Expanded( // ListView için genişlemiş alan
                  child: ListView.builder(
                    itemCount: routes.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          context.push("/SelectedRoutes", extra: routes[index]);
                        },
                        child: routesContainerDesign(
                          context,
                          routes[index]["id"] as int,
                          routes[index]["imagePath"].toString(), 
                          routes[index]["title"].toString(), 
                          routes[index]["stop"].toString(), 
                          routes[index]["rating"].toString(), 
                          routes[index]["views"].toString(), 
                          routes[index]["comments"].toString(),
                          routes[index]
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }

  Widget routesContainerDesign(BuildContext context, int id, String imagePath, String title, String stop, String rating, String views, String comments, index) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
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
          child: Center(
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
            if(savedRoutesCubit.isSavedRoutes(id))
            IconButton(
              icon: const Icon(
                Icons.bookmark,
                color: Colors.white,
              ),
              onPressed: () {
                savedRoutesCubit.removeFromSavedRoutes(id);
              },
            )
            else 
            IconButton(
              icon: const Icon(
                Icons.bookmark_outline,
                color: Colors.white,
              ),
              onPressed: () {
                savedRoutesCubit.addToSavedRoutes(index);
              },
            )
          ],
        ),
      ),
    ),
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: infoColumns(
            rating,
            views,
            comments,
            stop,
          ),
        ),
      ],
    );
  }

  Widget infoColumns(
    String rating,
    String views,
    String comments,
    String stop,
  ) {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoRow(
                context,
                Icons.directions_bus, // Durak ikonu
                ": $stop", // Durak sayısı
              ),
              infoRow(
                context,
                Icons.star,
                ": $rating",
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              infoRow(
                context,
                Icons.remove_red_eye,
                ": $views",
              ),
              infoRow(
                context,
                Icons.comment,
                ": $comments",
              ),
            ],
          ),
        ],
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
            width: MediaQuery.of(context).size.width * 0.43,
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

    // Function to show the custom sorting popup
  void _showSortPopup2(BuildContext context) {
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
                  AppLocalizations.of(context).getTranslate("filter"),
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
              ],
            ),
          ),
        );
      },
    );
  }
}