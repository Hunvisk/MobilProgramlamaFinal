
// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/saved_places/saved_places_cubit.dart';
import '../../../core/localizations.dart';
import '../../../widgets/myappbar.dart';

class SelectedRoutes extends StatefulWidget {
  final Map<String, dynamic> route;

  const SelectedRoutes({Key? key, required this.route}) : super(key: key);

  @override
  _SelectedRoutesState createState() => _SelectedRoutesState();
}

class _SelectedRoutesState extends State<SelectedRoutes> {
  late List<dynamic> places = [];
  late List<dynamic> routes = [];
  int routesPlaceslength = 0;
  late SavedPlacesCubit savedPlacesCubit;

  @override
  void initState() {
    super.initState();
    savedPlacesCubit = context.read<SavedPlacesCubit>();
    loadPlaces();
    loadRoutes();
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

  Future<void> loadRoutes() async {
    // JSON dosyasını oku
    String jsonString = await rootBundle.loadString('assets/data/routes.json');
    // JSON verisini parse et
    List<dynamic> jsonList = json.decode(jsonString);
    // State'i güncelle ve verileri atama
    setState(() {
      routes = jsonList;
      routesPlaceslength = widget.route["places"].length ;
    });
  }

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
        title: AppLocalizations.of(context).getTranslate(widget.route["title"]),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Theme.of(context).secondaryHeaderColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: const Center(
                  child: Text("Harita Eklenecek"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                AppLocalizations.of(context).getTranslate(widget.route["title"]),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Rota Açıklamaları",
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                infoRow(
                  context,
                  Icons.star,
                  widget.route["rating"],
                ),
                infoRow(
                  context,
                  Icons.remove_red_eye,
                  widget.route["views"],
                ),
                infoRow(
                  context,
                  Icons.comment,
                  widget.route["comments"],
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: Text(AppLocalizations.of(context).getTranslate("places")),
              children: [
                SizedBox(
                  height: 300, // ExpansionTile içinde ListView.builder'ın düzgün çalışması için sabit yükseklik verildi
                  child: ListView.builder(
                    itemCount: routesPlaceslength,
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
            ),
            const Divider(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  AppLocalizations.of(context).getTranslate("comments"),
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                child: ListView.builder(
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
              ),
          ],
        )
      ),
    );
  }
  Widget placesContainerDesign(BuildContext context, int id, String imagePath, String title, String rating, String views, String comments, index) {
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
                  if(savedPlacesCubit.isSavedPlaces(id))
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        savedPlacesCubit.removeFromSavedPlaces(id);
                      },
                    )
                  else 
                    IconButton(
                      icon: const Icon(
                        Icons.bookmark_outline,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        savedPlacesCubit.addToSavedPlaces(index);
                      },
                    )
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
            size: 15,
          ),
          const Gap(5),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
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
}