import 'package:mobx/mobx.dart';

import '../../models/place/place.dart';
import '../../services/place_api.dart';

part 'places_state.g.dart';

class PlacesState = _PlacesState with _$PlacesState;

abstract class _PlacesState with Store {
  final PlaceAPI placesRepository;

  @observable
  List<Place> places = [];

  _PlacesState(this.placesRepository) {
    loadPlaces();
  }

  @observable
  String error = '';

  @computed
  bool get isLoading => places.isEmpty && !hasError;
  @computed
  bool get hasError => error != '';

  @action
  Future<void> loadPlaces() async {
    places = await placesRepository
        .getAllPlaces()
        .then((places) => places)
        .catchError((e) {
      error = e.toString();
      print(error);
      return <Place>[];
    });
  }
}
