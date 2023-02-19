import 'package:flutter/material.dart';

import '../../models/room/room.dart';
import '../../theme/theme.dart';

class RoomDetailsPage extends StatelessWidget {
  RoomDetailsPage({required this.room, super.key});
  Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 75),
        child: ListView(children: [
          Stack(children: [
            room.details.photos.isEmpty
                ? const RoomImageDefault()
                : Image.network(
                    room.details.photos[0],
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
            Positioned(
              top: 24,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
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
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ImageIcon(
                  AssetImage('assets/icons/human.png'),
                  color: greyDark,
                ),
                Expanded(
                  child: Text(
                    room.details.type,
                    style: Theme.of(context).textTheme.titleMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text('${room.details.price} ₽',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 14, color: mainColor)),
                Text(' на 1 человека',
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall!
                        .copyWith(fontSize: 14)),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InRoom(),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InPlace(),
          ),
        ]),
      ),
      bottomSheet: Container(
        width: double.infinity,
        color: backColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
          child: ElevatedButton(
              onPressed: () {}, child: const Text('Забронировать')),
        ),
      ),
    );
  }
}

class InRoom extends StatelessWidget {
  const InRoom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Услуги в комнате',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16)),
        RoomServiceItem(icon: "assets/icons/tv.png", text: 'Телевизор'),
        RoomServiceItem(icon: "assets/icons/refr.png", text: 'Холодильник'),
        RoomServiceItem(
            icon: "assets/icons/tea.png", text: 'Электрический чайник'),
      ],
    );
  }
}

class RoomServiceItem extends StatelessWidget {
  const RoomServiceItem({required this.icon, required this.text, Key? key})
      : super(key: key);
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Image.asset(icon),
          SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }
}

class InPlace extends StatelessWidget {
  const InPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Услуги в общежитии',
            style:
                Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 16)),
        RoomServiceItem(icon: "assets/icons/wifi.png", text: 'Wi-fi в лобби'),
        RoomServiceItem(
            icon: "assets/icons/wash.png", text: 'Стиральная машина'),
        RoomServiceItem(icon: "assets/icons/tea.png", text: 'Душ'),
      ],
    );
  }
}

class RoomImageDefault extends StatelessWidget {
  const RoomImageDefault({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/room.png",
      height: MediaQuery.of(context).size.height / 4,
      width: MediaQuery.of(context).size.height * 3 / 4,
      fit: BoxFit.cover,
    );
  }
}
