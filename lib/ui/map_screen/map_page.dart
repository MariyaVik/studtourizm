import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:studtourizm/ui/app.dart';
import 'package:studtourizm/ui/navigation.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../theme/theme.dart';
import 'bottom_panel.dart';
import 'map.dart';
import 'select_entity.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  double filterHight = 165;
  @override
  Widget build(BuildContext context) {
    final maxH = MediaQuery.of(context).size.height * 0.7;
    final minH = MediaQuery.of(context).size.height * 0.2;
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
                onPressed: () {
                  mainNavigatorKey.currentState!
                      .pushNamed(AppNavRouteName.selectRegion);
                },
                icon: Image.asset('assets/icons/map.png',
                    height: 24, color: mainColor)),
          ],
        ),
        body: Stack(
          children: [
            SlidingUpPanel(
              maxHeight: maxH,
              minHeight: minH,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              parallaxEnabled: true,
              parallaxOffset: 0.5,
              body: MapWithMarkers(),
              panelBuilder: (sc) => PanelWidget(sc: sc),
              onPanelSlide: (position) {
                final hightKoef = maxH - minH;
                filterHight = position * hightKoef + minH;
                setState(() {});
              },
            ),
            Positioned(bottom: filterHight, child: SelectEntityWidget()),
          ],
        )
        // Stack(
        //   children: const [
        //     MapWithMarkers(),
        //     BottomPanel(),
        //   ],
        // ),
        );
  }
}
