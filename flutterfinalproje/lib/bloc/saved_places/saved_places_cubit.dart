import 'package:flutter_bloc/flutter_bloc.dart';
part 'saved_places_state.dart';

class SavedPlacesCubit extends Cubit<SavedPlacesState> {
  SavedPlacesCubit(SavedPlacesState initialState) : super(initialState);

  void addToSavedPlaces(Map<String, dynamic> place) {
    var currentSavedPlaces = state.savedPlaces;

    bool found = false;

    for (int i = 0; i < currentSavedPlaces.length; i++) {
      if (currentSavedPlaces[i]["id"] == place["id"]) {
        found = true;
        break;
      }
    }

    if (!found) {
      currentSavedPlaces.add(place);
      final newState = SavedPlacesState(savedPlaces: currentSavedPlaces);
      emit(newState);

      //print("eklendi");
    }
  }

  void addToSavedPlaces2(Map<String, dynamic> place) {
  var currentSavedPlaces = state.savedPlaces;

  if (currentSavedPlaces.any((element) => element["id"] == place["id"])) {
    // Mekan zaten favori olarak eklenmiş, bir şey yapmamıza gerek yok.
  } else {
    currentSavedPlaces.add(place);
    final newState = SavedPlacesState(savedPlaces: currentSavedPlaces);
    emit(newState);
  }
}


  bool isSavedPlaces(int placeId) {
    return state.savedPlaces.any((element) => element["id"] == placeId);
  }

  void removeFromSavedPlaces(int placeId) {
    var currentSavedPlaces = state.savedPlaces;

    currentSavedPlaces.removeWhere((element) => element["id"] == placeId);

    final newState = SavedPlacesState(savedPlaces: currentSavedPlaces);

    emit(newState);
  }

  void clearSavedPlaces() {
    final updatedState = SavedPlacesState(savedPlaces: const []);

    emit(updatedState);
  }
}
