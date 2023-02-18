import 'package:flutter/material.dart';

import '../../models/place/place.dart';

class PlaceMainInfo extends StatelessWidget {
  const PlaceMainInfo(
      {required this.place,
      this.nameSize = 15,
      this.univSize = 11,
      this.addressSize = 11,
      super.key});
  final Place place;
  final double nameSize;
  final double univSize;
  final double addressSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            place.details.mainInfo.name,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontSize: nameSize),
          ),
        ),
        Text(
          'ФГАОУ ВО Самарский национальный исследовательский университет имени академика С.П. Королева',
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(fontSize: univSize),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            'ул ${place.details.mainInfo.street} д ${place.details.mainInfo.houseNumber}',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontSize: addressSize),
          ),
        ),
      ],
    );
  }
}
