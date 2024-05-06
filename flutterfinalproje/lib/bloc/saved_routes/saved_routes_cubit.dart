import 'package:flutter_bloc/flutter_bloc.dart';
part 'saved_routes_state.dart';

class SavedRoutesCubit extends Cubit<SavedRoutesState> {
  SavedRoutesCubit(SavedRoutesState initialState) : super(initialState);

  void addToSavedRoutes(Map<String, dynamic> route) {
    var currentRoutesPlaces = state.savedRoutes;

    bool found = false;

    for (int i = 0; i < currentRoutesPlaces.length; i++) {
      if (currentRoutesPlaces[i]["id"] == route["id"]) {
        found = true;
        break;
      }
    }

    if (!found) {
      currentRoutesPlaces.add(route);
      final newState = SavedRoutesState(savedRoutes: currentRoutesPlaces);
      emit(newState);

      //print("eklendi");
    }
  }

  void addToSavedRoutes2(Map<String, dynamic> route) {
  var currentRoutesPlaces = state.savedRoutes;

  if (currentRoutesPlaces.any((element) => element["id"] == route["id"])) {
    // Mekan zaten favori olarak eklenmiş, bir şey yapmamıza gerek yok.
  } else {
    currentRoutesPlaces.add(route);
    final newState = SavedRoutesState(savedRoutes: currentRoutesPlaces);
    emit(newState);
  }
}


  bool isSavedRoutes(int routeId) {
    return state.savedRoutes.any((element) => element["id"] == routeId);
  }

  void removeFromSavedRoutes(int routeId) {
    var currentRoutesPlaces = state.savedRoutes;

    currentRoutesPlaces.removeWhere((element) => element["id"] == routeId);

    final newState = SavedRoutesState(savedRoutes: currentRoutesPlaces);

    emit(newState);
  }

  void clearSavedRoutes() {
    final updatedState = SavedRoutesState(savedRoutes: const []);

    emit(updatedState);
  }
}
