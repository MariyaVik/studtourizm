import 'package:flutter/material.dart';
import 'package:studtourizm/models/event/event_details.dart';
import 'package:studtourizm/models/place/place_details.dart';
import 'package:studtourizm/ui/auth/auth_page.dart';
import 'package:studtourizm/ui/profile/profile_page.dart';

import '../models/event/event.dart';
import '../models/place/place.dart';
import 'events/event_details_page.dart';
import 'home.dart';
import 'map_screen/map_page.dart';
import 'onboarding_screen/onboarding_page.dart';
import 'places/place_details.dart';
import 'profile/notif_page.dart';
import 'select_region/select_region_page.dart';

abstract class AppNavRouteName {
  static const onboarding = 'onboarding';
  static const selectRegion = 'selectRegion';
  static const home = 'home';
  static const map = 'map';
  static const placeDetails = 'map/placeDetails';
  static const eventDetails = 'map/eventDetails';
  static const auth = 'auth';
  static const profile = 'profile';
  static const notif = 'profile/notif';
}

class AppNavigation {
  static const initialRoute = AppNavRouteName.home;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingPage());
      case AppNavRouteName.home:
        return MaterialPageRoute(builder: (context) => HomePage());
      case AppNavRouteName.auth:
        return MaterialPageRoute(builder: (context) => const AuthPage());
      case AppNavRouteName.selectRegion:
        return MaterialPageRoute(
            builder: (context) => const SelectRegionPage());

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
      case AppNavRouteName.placeDetails:
        final arg = settings.arguments as Place;
        return MaterialPageRoute(
            builder: (context) => PlaceDetailsPage(place: arg));
      case AppNavRouteName.eventDetails:
        final arg = settings.arguments as Event;
        return MaterialPageRoute(
            builder: (context) => EventDetailsPage(currentEvent: arg));

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested navigation error!!!'))));
    }
  }
}

class ProfNestedNavigation {
  static const initialRoute = AppNavRouteName.profile;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNavRouteName.profile:
        return MaterialPageRoute(builder: (context) => const ProfilePage());
      case AppNavRouteName.notif:
        return MaterialPageRoute(builder: (context) => const NotifList());

      default:
        return MaterialPageRoute(
            builder: (context) => const Scaffold(
                body: Center(child: Text('Nested navigation error!!!'))));
    }
  }
}
