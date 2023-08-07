import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/common/common_state.dart';

import '../models/tab.dart';
import 'bids_screen/bids_page.dart';
import 'navigation.dart';
import 'rating/rating_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final _bottomItems = [
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/map.png')), label: 'Карта'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/achiev.png')),
        label: 'Достижения'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/doc.png')), label: 'Заявки'),
    const BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/icons/profile.png')),
        label: 'Профиль'),
  ];

  @override
  Widget build(BuildContext context) {
    final state = Provider.of<CommonState>(context);
    return Scaffold(
      body: Observer(
        builder: (context) => state.activeTabIndex == AppTab.map.index
            ? const Navigator(
                initialRoute: MapNestedNavigation.initialRoute,
                onGenerateRoute: MapNestedNavigation.onGenerateRoute,
              )
            : state.activeTabIndex == AppTab.achiev.index
                ? const RatingPage()
                : state.activeTabIndex == AppTab.bids.index
                    ? const BidsPage()
                    : const Navigator(
                        initialRoute: ProfNestedNavigation.initialRoute,
                        onGenerateRoute: ProfNestedNavigation.onGenerateRoute,
                      ),
      ),
      bottomNavigationBar: Observer(
          builder: (context) => BottomNavigationBar(
                currentIndex: state.activeTabIndex,
                onTap: state.updateTab,
                items: _bottomItems,
              )),
    );
  }
}
