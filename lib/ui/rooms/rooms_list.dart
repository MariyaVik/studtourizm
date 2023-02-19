import 'package:flutter/material.dart';

import '../../models/room/room.dart';
import '../navigation.dart';
import 'room_card.dart';

class RoomsList extends StatelessWidget {
  RoomsList({required this.room, Key? key}) : super(key: key);

  final Room room;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed(AppNavRouteName.roomDetails, arguments: room);
            },
            child: RoomCard());
      },
      itemCount: 3,
    );
  }
}
