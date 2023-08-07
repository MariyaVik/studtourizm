import 'package:flutter/material.dart';

import '../../models/place/place.dart';
import '../utils.dart';
import 'place_main_info.dart';

class PlaceCard extends StatelessWidget {
  const PlaceCard({required this.place, Key? key}) : super(key: key);
  final Place place;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PlaceMainInfo(place: place),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: place.details.mainInfo.photos.isEmpty
                      ? const PlaceImageDefault()
                      : Image.network(
                          place.details.mainInfo.photos[0],
                          height: MediaQuery.of(context).size.height / 4,
                          width: MediaQuery.of(context).size.height * 3 / 4,
                          fit: BoxFit.cover,
                        ),
                ),
                Positioned(
                    right: 16,
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          const ImageIcon(AssetImage('assets/icons/heart.png')),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Text(
                    'Питание ',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontSize: 14),
                  ),
                  Text(
                    getMealPlan(place.details.mainInfo.mealPlan),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 14),
                  ),
                ],
              ),
            ),
            Text(
              'Продолжительность пребывания ',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14),
            ),
            Text(
                'от ${place.details.mainInfo.minDays} до ${place.details.mainInfo.maxDays} дней',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 14)),
          ],
        ),
      ),
    );
  }
}

class PlaceImageDefault extends StatelessWidget {
  const PlaceImageDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/house.png",
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.height * 3 / 4,
      fit: BoxFit.cover,
    );
  }
}
