import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/places/places_state.dart';
import '../../models/place/place.dart';
import '../navigation.dart';
import 'place_card.dart';

class PlacesListWidget extends StatelessWidget {
  final ScrollController controller;
  const PlacesListWidget({required this.controller, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        controller: controller,
        physics: const ScrollPhysics(),
        child: Observer(builder: (context) {
          print('build: PlacesList');
          final placesProvider = Provider.of<PlacesState>(context);

          return placesProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : placesProvider.hasError
                  ? Center(
                      child: Text(placesProvider.error),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: placesProvider.places.length,
                          itemBuilder: (context, index) {
                            print(' рисуем карточку события');

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppNavRouteName.eventDetails,
                                      arguments: placesProvider.places[index]);
                                },
                                child: PlaceCard(
                                  place: placesProvider.places[index],
                                ),
                              ),
                            );
                          }),
                    );
        }));
  }
}
