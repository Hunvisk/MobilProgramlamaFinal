import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../bloc/saved_places/saved_places_cubit.dart';
import '../../../bloc/saved_placestovisit/saved_placestovisit_cubit.dart';
import '../../../bloc/saved_routes/saved_routes_cubit.dart';
import '../../../core/localizations.dart';
import '../../../widgets/myappbar.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  late SavedPlacesToVisitCubit savedPlacesToVisitCubit;
  late SavedPlacesCubit savedPlacesCubit;
  late SavedRoutesCubit savedRoutesCubit;

  @override
  void initState() {
    super.initState();
    savedPlacesToVisitCubit = context.read<SavedPlacesToVisitCubit>();
    savedPlacesCubit = context.read<SavedPlacesCubit>();
    savedRoutesCubit = context.read<SavedRoutesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: AppLocalizations.of(context).getTranslate("saved"),
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<SavedPlacesToVisitCubit, SavedPlacesToVisitState>(
            listener: (context, state) {},
          ),
          BlocListener<SavedPlacesCubit, SavedPlacesState>(
            listener: (context, state) {},
          ),
          BlocListener<SavedRoutesCubit, SavedRoutesState>(
            listener: (context, state) {},
          ),
        ],
        child: SingleChildScrollView(
          child: Column(
            children: [
              BlocBuilder<SavedPlacesToVisitCubit, SavedPlacesToVisitState>(
                builder: (context, savedPlacesToVisitState) {
                  return BlocBuilder<SavedPlacesCubit, SavedPlacesState>(
                    builder: (context, savedPlacesState) {
                      return BlocBuilder<SavedRoutesCubit, SavedRoutesState>(
                        builder: (context, savedRoutesState,) {
                          return Column(
                            children: [
                              SavedBox(
                                path: "/SavedPlacesToVisit",
                                title: "place_to_visit",
                                backgroundImage: savedPlacesToVisitState.savedPlacesToVisit.isNotEmpty
                                    ? savedPlacesToVisitState.savedPlacesToVisit[0]["images"][0].toString()
                                    : null,
                              ),
                              SavedBox(
                                path: "/SavedPlaces",
                                title: "savedPlaces",
                                backgroundImage: savedPlacesState.savedPlaces.isNotEmpty
                                    ? savedPlacesState.savedPlaces[0]["images"][0].toString()
                                    : null,
                              ),
                              SavedBox(
                                path: "/SavedRoutes",
                                title: "savedRoutes",
                                backgroundImage: savedRoutesState.savedRoutes.isNotEmpty
                                    ? savedRoutesState.savedRoutes[0]["imagePath"].toString()
                                    : null,
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                }
              )
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
    this.backgroundImage,
  });

  final String path;
  final String title;
  final String? backgroundImage;

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
            image: backgroundImage != null
                ? DecorationImage(
                    image: AssetImage(backgroundImage!),
                    fit: BoxFit.cover,
                  )
                : null,
            color: backgroundImage == null
                ? Theme.of(context).secondaryHeaderColor
                : null,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 175,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        AppLocalizations.of(context).getTranslate(title),
                        style: const TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
