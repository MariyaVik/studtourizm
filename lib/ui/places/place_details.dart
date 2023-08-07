import 'package:flutter/material.dart';

import '../../models/place/place.dart';
import '../../models/room/room.dart';
import '../../models/room/room_data_range.dart';
import '../../models/room/room_details.dart';
import '../../theme/theme.dart';
import '../rooms/rooms_list.dart';
import '../utils.dart';
import 'place_card.dart';
import 'place_main_info.dart';

class PlaceDetailsPage extends StatelessWidget {
  final Place place;
  const PlaceDetailsPage({required this.place, super.key});

  @override
  Widget build(BuildContext context) {
    // Provider.of<CommonState>(context).hasAppBar = false;
    return Scaffold(
      // appBar: AppBar(),
      body: ListView(children: [
        Stack(children: [
          place.details.mainInfo.photos.isEmpty
              ? const PlaceImageDefault()
              : Image.network(
                  place.details.mainInfo.photos[0],
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
          Positioned(
            top: 24,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    // padding: EdgeInsets.all(20),
                    backgroundColor: Colors.white.withOpacity(0.84),
                    elevation: 0),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: mainColor,
                )),
          )
        ]),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, top: 8),
          child: PlaceMainInfo(
              place: place, nameSize: 20, univSize: 13, addressSize: 14),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Продолжительность пребывания ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                        'от ${place.details.mainInfo.minDays} до ${place.details.mainInfo.maxDays} дней',
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  // mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Питание ',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(getMealPlan(place.details.mainInfo.mealPlan),
                        style: Theme.of(context).textTheme.labelMedium),
                  ],
                ),
              )
            ],
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text('Комнаты', style: Theme.of(context).textTheme.titleLarge),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16, left: 16, bottom: 16),
          child: RoomsList(
            room: Room(
                details: RoomDetails(
                    dateRange: RoomDateRange(from: 5, to: 7),
                    type: '2-х местный номер',
                    isFree: false,
                    amount: '3',
                    price: '800',
                    description: 'description',
                    photos: [
                  "https://stud-files.sabir.pro/files/1Z8I3pI1LK-d19bfdc7942ed901949e315cbe93458a738ba4d9d7b4223b7b06e01421457975.jpg",
                  "https://stud-files.sabir.pro/files/1Z8I3pI1LK-cfe4ce6078cb070983d761dc986eda295fa100412c302573ef3bdd4f68b205d7.jpg",
                  "https://stud-files.sabir.pro/files/1Z8I3pI1LK-62ff28a52c058e7f42dcfbb3daa7458b9ee3458a3f5e8cd593bf5ab4ad99f279.jpg",
                  "https://stud-files.sabir.pro/files/1Z8I3pI1LK-599b4e92ee643bfab68605aecdc8e3f1298575096a3978d92966b4c43e8306c0.jpg"
                ])),
          ),
        )
        // RoomCard(),
      ]),
    );
  }
}
