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
                  : Builder(builder: (context) {
                      List<Place> pl = placesProvider.places;
                      pl.shuffle();
                      int ind = Random().nextInt(200);
                      pl = pl.sublist(ind, ind + 6);
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                pl.length, //placesProvider.places.length,
                            itemBuilder: (context, index) {
                              // print(placesProvider.places[index]);
                              return GestureDetector(
                                onTap: () {},
                                child: PlaceCard(place: pl[index]),
                              );
                            }),
                      );
                    });
        }));
  }
}
