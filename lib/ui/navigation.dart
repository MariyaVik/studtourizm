import 'package:flutter/material.dart';

import 'home.dart';
import 'map_screen/map_page.dart';
import 'onboarding_screen/onboarding_page.dart';

abstract class AppNavRouteName {
  static const onboarding = 'onboarding';
  static const home = 'home';
  static const map = 'map';
}

class AppNavigation {
  static const initialRoute = AppNavRouteName.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());
      case AppNavRouteName.home:
        return MaterialPageRoute(builder: (context) => const HomePage());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Navigation error!!!'))));
    }
  }
}

class MapNestedNavigation {
  static const initialRoute = AppNavRouteName.map;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.map:
        return MaterialPageRoute(builder: (context) => const MapPage());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested navigation error!!!'))));
    }
  }
}
