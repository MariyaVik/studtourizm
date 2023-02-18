import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studtourizm/mobx/places/places_state.dart';
import 'package:studtourizm/models/event/event_details.dart';
import 'package:studtourizm/ui/app.dart';
import 'package:studtourizm/ui/events/event_card.dart';
import 'package:studtourizm/ui/navigation.dart';

import '../../mobx/common/common_state.dart';
import '../../models/event/event.dart';
import '../../theme/theme.dart';
import '../places/places_list.dart';

class EventDetailsPage extends StatelessWidget {
  final Event currentEvent;
  EventDetailsPage({
    required this.currentEvent,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<PlacesState>(context).loadPlacesNearEvent(currentEvent.id);
    print('build: EventDetailsPage');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: Scaffold(
          appBar: AppBar(),
          body: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: EventCard(
                  event: currentEvent,
                  dataCompact: false,
                ),
              ),
              MoreInfo(details: currentEvent.details!),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (!Provider.of<CommonState>(context, listen: false)
                          .isAuth) {
                        mainNavigatorKey.currentState!
                            .pushNamed(AppNavRouteName.auth);
                      } else {}
                    },
                    child: Text('Оставить заявку')),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Варианты размещения',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              PlacesListWidget(controller: ScrollController()),
            ],
          )),
    );
  }
}

class MoreInfo extends StatelessWidget {
  final EventDetails details;
  const MoreInfo({required this.details, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Специализация',
            style: Theme.of(context).textTheme.titleSmall!.copyWith(
                fontSize:
                    11), //TextStyle(fontSize: 11, fontWeight: FontWeight.w600),
          ),
          Text(
            'Информатика-искуственный интеллект',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(fontSize: 11), //TextStyle(
            //fontSize: 11, fontWeight: FontWeight.w600, color: mainColor),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12, bottom: 20),
            child: Text(details.description),
          ),
        ],
      ),
    );
  }
}
