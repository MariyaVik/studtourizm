// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'places_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlacesState on _PlacesState, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading => (_$isLoadingComputed ??=
          Computed<bool>(() => super.isLoading, name: '_PlacesState.isLoading'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_PlacesState.hasError'))
      .value;

  late final _$placesAtom = Atom(name: '_PlacesState.places', context: context);

  @override
  List<Place> get places {
    _$placesAtom.reportRead();
    return super.places;
  }

  @override
  set places(List<Place> value) {
    _$placesAtom.reportWrite(value, super.places, () {
      super.places = value;
    });
  }

  late final _$placesNearUserAtom =
      Atom(name: '_PlacesState.placesNearUser', context: context);

  @override
  List<Place> get placesNearUser {
    _$placesNearUserAtom.reportRead();
    return super.placesNearUser;
  }

  @override
  set placesNearUser(List<Place> value) {
    _$placesNearUserAtom.reportWrite(value, super.placesNearUser, () {
      super.placesNearUser = value;
    });
  }

  late final _$errorAtom = Atom(name: '_PlacesState.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$loadPlacesAsyncAction =
      AsyncAction('_PlacesState.loadPlaces', context: context);

  @override
  Future<void> loadPlaces() {
    return _$loadPlacesAsyncAction.run(() => super.loadPlaces());
  }

  late final _$loadPlacesNearEventAsyncAction =
      AsyncAction('_PlacesState.loadPlacesNearEvent', context: context);

  @override
  Future<void> loadPlacesNearEvent(String eventId) {
    return _$loadPlacesNearEventAsyncAction
        .run(() => super.loadPlacesNearEvent(eventId));
  }

  late final _$loadPlacesNearUserAsyncAction =
      AsyncAction('_PlacesState.loadPlacesNearUser', context: context);

  @override
  Future<void> loadPlacesNearUser(double lat, double long) {
    return _$loadPlacesNearUserAsyncAction
        .run(() => super.loadPlacesNearUser(lat, long));
  }

  @override
  String toString() {
    return '''
places: ${places},
placesNearUser: ${placesNearUser},
error: ${error},
isLoading: ${isLoading},
hasError: ${hasError}
    ''';
  }
}
