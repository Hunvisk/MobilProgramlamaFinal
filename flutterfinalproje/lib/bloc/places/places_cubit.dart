import 'package:flutter_bloc/flutter_bloc.dart';
part 'places_state.dart';

class PlaceCubit extends Cubit<PlacesState> {
  PlaceCubit(PlacesState initialState) : super(initialState);

  void addToFavorites(Map<String, dynamic> place) {
    var currentFavorites = state.favorites;

    bool found = false;

    for (int i = 0; i < currentFavorites.length; i++) {
      if (currentFavorites[i]["id"] == place["id"]) {
        found = true;
        break;
      }
    }

    if (!found) {
      currentFavorites.add(place);
      final newState = PlacesState(favorites: currentFavorites);
      emit(newState);

      //print("eklendi");
    }
  }

  void addToFavorites2(Map<String, dynamic> place) {
  var currentFavorites = state.favorites;

  if (currentFavorites.any((element) => element["id"] == place["id"])) {
    // Mekan zaten favori olarak eklenmiş, bir şey yapmamıza gerek yok.
  } else {
    currentFavorites.add(place);
    final newState = PlacesState(favorites: currentFavorites);
    emit(newState);
  }
}


  bool isFavorite(int placeId) {
    return state.favorites.any((element) => element["id"] == placeId);
  }

  void removeFromFavorites(int placeId) {
    var currentFavorites = state.favorites;

    currentFavorites.removeWhere((element) => element["id"] == placeId);

    final newState = PlacesState(favorites: currentFavorites);

    emit(newState);
  }

  void clearFavorites() {
    final updatedState = PlacesState(favorites: const []);

    emit(updatedState);
  }
}
