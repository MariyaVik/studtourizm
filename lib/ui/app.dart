import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/events/events_state.dart';
import 'package:studtourizm/services/events_api.dart';
import 'package:studtourizm/services/get_user_geo.dart';

import '../mobx/common/common_state.dart';
import '../mobx/places/places_state.dart';
import '../services/place_api.dart';
import '../theme/theme.dart';
import 'navigation.dart';

GlobalKey<NavigatorState> mainNavigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CommonState(UserGeo())),
        Provider(create: (context) => PlacesState(PlaceAPI())),
        Provider(create: (context) => EventsState(EventsAPI())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: themeLight,
        navigatorKey: mainNavigatorKey,
        initialRoute: AppNavRouteName.onboarding,
        onGenerateRoute: AppNavigation.onGenerateRoute,
      ),
    );
  }
}
