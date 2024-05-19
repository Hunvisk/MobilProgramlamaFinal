import 'package:flutter_bloc/flutter_bloc.dart';
part 'saved_placestovisit_state.dart';

class SavedPlacesToVisitCubit extends Cubit<SavedPlacesToVisitState> {
  SavedPlacesToVisitCubit(SavedPlacesToVisitState initialState) : super(initialState);

  void addToSavedPlacesToVisit(Map<String, dynamic> placeToVisit) {
    var currentSavedPlacesToVisit = state.savedPlacesToVisit;

    bool found = false;

    for (int i = 0; i < currentSavedPlacesToVisit.length; i++) {
      if (currentSavedPlacesToVisit[i]["id"] == placeToVisit["id"]) {
        found = true;
        break;
      }
    }

    if (!found) {
      currentSavedPlacesToVisit.add(placeToVisit);
      final newState = SavedPlacesToVisitState(savedPlacesToVisit: currentSavedPlacesToVisit);
      emit(newState);

    }
  }

  void addToSavedPlacesToVisit2(Map<String, dynamic> placeToVisit) {
  var currentSavedPlacesToVisit = state.savedPlacesToVisit;

  if (currentSavedPlacesToVisit.any((element) => element["id"] == placeToVisit["id"])) {
    // Mekan zaten favori olarak eklenmiş, bir şey yapmamıza gerek yok.
  } else {
    currentSavedPlacesToVisit.add(placeToVisit);
    final newState = SavedPlacesToVisitState(savedPlacesToVisit: currentSavedPlacesToVisit);
    emit(newState);
  }
}


  bool isSavedPlacesToVisit(int placeToVisitId) {
    return state.savedPlacesToVisit.any((element) => element["id"] == placeToVisitId);
  }

  void removeFromSavedPlacesToVisit(int placeToVisitId) {
    var currentSavedPlacesToVisit = state.savedPlacesToVisit;

    currentSavedPlacesToVisit.removeWhere((element) => element["id"] == placeToVisitId);

    final newState = SavedPlacesToVisitState(savedPlacesToVisit: currentSavedPlacesToVisit);

    emit(newState);
  }

  void clearSavedPlacesToVisit() {
    final updatedState = SavedPlacesToVisitState(savedPlacesToVisit: const []);

    emit(updatedState);
  }
}
