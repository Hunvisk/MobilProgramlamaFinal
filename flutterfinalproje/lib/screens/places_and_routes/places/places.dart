import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/saved_places/saved_places_cubit.dart';
import '../../../bloc/saved_placestovisit/saved_placestovisit_cubit.dart';
import '../../../core/localizations.dart';
import '../../../widgets/appbarwithsearchicon.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});
  
  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  bool isSearching = false;
  late List<dynamic> places = [];
  late SavedPlacesCubit savedPlacesCubit;
  late SavedPlacesToVisitCubit savedPlacesToVisitCubit;

  @override
  void initState() {
    super.initState();
    savedPlacesCubit = context.read<SavedPlacesCubit>();
    savedPlacesToVisitCubit = context.read<SavedPlacesToVisitCubit>();
    loadPlaces();
  }

  Future<void> loadPlaces() async {
    // JSON dosyasını oku
    String jsonString = await rootBundle.loadString('assets/data/places.json');
    // JSON verisini parse et
    List<dynamic> jsonList = json.decode(jsonString);
    // State'i güncelle ve verileri atama
    setState(() {
      places = jsonList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWithSearchIcon(
          title: AppLocalizations.of(context).getTranslate("places"),
          icon: const Icon(Icons.search),
          onSearchChanged: (isSearching) {
            setState(() {
              this.isSearching = isSearching;
            });
          },
        ),
        body: BlocBuilder<SavedPlacesToVisitCubit, SavedPlacesToVisitState>(
          builder: (context, savedPlacesToVisitState) {
            return BlocBuilder<SavedPlacesCubit, SavedPlacesState>(
              builder: (context, savedPlacesState) {
                return Column( // Column ekliyorum
                  children: [
                    const FilterWidget(), // FilterWidget eklendi
                    Expanded( // ListView için genişlemiş alan
                      child: ListView.builder(
                        itemCount: places.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              context.push(
                                "/SelectedPlaces", extra: places[index]);
                            },
                            child: placesContainerDesign(
                              context,
                              places[index]["id"] as int,
                              places[index]["images"][0].toString(), 
                              places[index]["title"].toString(), 
                              places[index]["rating"].toString(), 
                              places[index]["views"].toString(), 
                              places[index]["comments"].toString(),
                              places[index]
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
            );
          }
        ),
      ),
    );
  }

  void _showSaveOptions(int id, dynamic place) {
    showDialog(
      context: context,
      builder: (context) {
        bool isSavedPlace = savedPlacesCubit.isSavedPlaces(id);
        bool isSavedPlaceToVisit = savedPlacesToVisitCubit.isSavedPlacesToVisit(id);
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              title: Text(AppLocalizations.of(context).getTranslate("saving_options"),),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context).getTranslate("savedPlaces"),),
                    value: isSavedPlace,
                    onChanged: (bool? value) {
                      setState(() {
                        isSavedPlace = value ?? false;
                        if (isSavedPlace) {
                          savedPlacesCubit.addToSavedPlaces(place);
                        } else {
                          savedPlacesCubit.removeFromSavedPlaces(id);
                        }
                      });
                    },
                  ),
                  CheckboxListTile(
                    title: Text(AppLocalizations.of(context).getTranslate("places_to_visit"),),
                    value: isSavedPlaceToVisit,
                    onChanged: (bool? value) {
                      setState(() {
                        isSavedPlaceToVisit = value ?? false;
                        if (isSavedPlaceToVisit) {
                          savedPlacesToVisitCubit.addToSavedPlacesToVisit(place);
                        } else {
                          savedPlacesToVisitCubit.removeFromSavedPlacesToVisit(id);
                        }
                      });
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: Text(AppLocalizations.of(context).getTranslate("close"),),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget placesContainerDesign(BuildContext context, int id, String imagePath, String title, String rating, String views, String comments, index) {
    bool isSavedPlace = savedPlacesCubit.isSavedPlaces(id);
    bool isWantedPlace = savedPlacesToVisitCubit.isSavedPlacesToVisit(id);

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
                      AppLocalizations.of(context).getTranslate(title),
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
                      (isSavedPlace || isWantedPlace)
                          ? Icons.bookmark
                          : Icons.bookmark_outline,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showSaveOptions(id, index);
                    },
                  ),
                ],
              ),
            ),
          )
        ),
        Positioned(
          bottom: 5,
          left: 10,
          right: 10,
          child: infoColumns(rating, views, comments),
        ),
      ],
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
          infoRow(
            context,
             Icons.star,
             ": $rating",
          ),
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
