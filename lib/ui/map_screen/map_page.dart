import 'package:flutter/material.dart';

import '../../theme/theme.dart';
import 'bottom_panel.dart';
import 'map.dart';

class MapPage extends StatelessWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset('assets/images/logo_only.png', height: 44, width: 54),
            Text('студтуризм.рф',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(fontSize: 11)),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset('assets/icons/map.png',
                  height: 24, color: mainColor)),
        ],
      ),
      body: Stack(
        children: const [
          MapWithMarkers(),
          BottomPanel(),
        ],
      ),
    );
  }
}
