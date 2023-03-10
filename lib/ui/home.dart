import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/common/common_state.dart';

import '../models/tab.dart';
import '../theme/theme.dart';
import 'bids_screen/bids_page.dart';
import 'navigation.dart';
import 'profile/profile_page.dart';
import 'rating/rating_page.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
// late TabController _tabController;
// int _currentTabIndex = 0;

// final _bottomItems = [
//   const BottomNavigationBarItem(
//       icon: ImageIcon(AssetImage('assets/icons/map.png')), label: 'Карта'),
//   const BottomNavigationBarItem(
//       icon: ImageIcon(AssetImage('assets/icons/achiev.png')),
//       label: 'Достижения'),
//   const BottomNavigationBarItem(
//       icon: ImageIcon(AssetImage('assets/icons/doc.png')), label: 'Заявки'),
//   const BottomNavigationBarItem(
//       icon: ImageIcon(AssetImage('assets/icons/profile.png')),
//       label: 'Профиль'),
// ];

// @override
// void initState() {
//   super.initState();
//   _tabController = TabController(length: 4, vsync: this);
// }

// @override
// Widget build(BuildContext context) {
//   return SafeArea(
//     child: Scaffold(
//       body: TabBarView(
//           physics: const NeverScrollableScrollPhysics(),
//           controller: _tabController,
//           children: [
//             const Navigator(
//               initialRoute: MapNestedNavigation.initialRoute,
//               onGenerateRoute: MapNestedNavigation.onGenerateRoute,
//             ),
//             RatingPage(),
//             BidsPage(),
//             const Navigator(
//               initialRoute: ProfNestedNavigation.initialRoute,
//               onGenerateRoute: ProfNestedNavigation.onGenerateRoute,
//             ),
//           ]),
//       bottomNavigationBar: BottomNavigationBar(
//           onTap: (currentIndex) {
//             _tabController.index = currentIndex;
//             setState(() {
//               _currentTabIndex = currentIndex;
//               _tabController.animateTo(_currentTabIndex);
//               Provider.of<CommonState>(context, listen: false)
//                   .activeTabIndex = currentIndex;
//             });
//           },
//           currentIndex: _currentTabIndex,
//           items: _bottomItems),
//     ),
//   );
// }

// }

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
                ? RatingPage()
                : state.activeTabIndex == AppTab.bids.index
                    ? BidsPage()
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
