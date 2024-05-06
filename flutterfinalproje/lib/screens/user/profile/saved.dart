import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/localizations.dart';
import '../../../widgets/myappbar.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});
  

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("saved"),
      ),
      body: const Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SavedBox(
                path: "/PlaceToVisit",
                title: "place_to_visit",
              ),
              SavedBox(
                path: "/SavedPlaces",
                title: "savedPlaces",
              ),
              SavedBox(
                path: "/SavedRoutes",
                title: "savedRoutes",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedBox extends StatelessWidget {
  const SavedBox({
    super.key,
    required this.path,
    required this.title,
  });

  final String path;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          context.push(path);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).secondaryHeaderColor,
            borderRadius: BorderRadius.circular(10)
          ),
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.amber,
                      height: 100,
                      width: 85,
                    ),
                    Container(
                      color: Colors.green,
                      height: 100,
                      width: 85,
                    ),
                    Container(
                      color: Colors.purple,
                      height: 100,
                      width: 85,
                    ),
                    Container(
                      color: Colors.red,
                      height: 100,
                      width: 85,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Text(
                    AppLocalizations.of(context).getTranslate(title),
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  )
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

