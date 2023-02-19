import 'package:flutter/material.dart';

import '../../theme/theme.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ImageIcon(
              AssetImage('assets/icons/human.png'),
              color: greyDark,
            ),
            Text(
              'Двухместный номер',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 14),
            ),
          ],
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            "assets/images/room.png",
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.height * 3 / 4,
            fit: BoxFit.cover,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              '300 ₽ ',
              style: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(color: mainColor, fontSize: 15),
            ),
            Text(
              'на человека',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
      ],
    );
  }
}
