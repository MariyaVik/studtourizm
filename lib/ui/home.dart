import 'package:flutter/material.dart';

import '../theme/theme.dart';
import 'navigation.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentTabIndex = 0;

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
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: [
              const Navigator(
                initialRoute: MapNestedNavigation.initialRoute,
                onGenerateRoute: MapNestedNavigation.onGenerateRoute,
              ),
              Container(color: mainColor),
              Container(color: greyLight),
              Container(color: backColor),
            ]),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (currentIndex) {
              _tabController.index = currentIndex;
              setState(() {
                _currentTabIndex = currentIndex;
                _tabController.animateTo(_currentTabIndex);
              });
            },
            currentIndex: _currentTabIndex,
            items: _bottomItems),
      ),
    );
  }
}
