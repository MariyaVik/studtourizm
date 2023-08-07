import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/events/events_state.dart';
import '../navigation.dart';
import 'event_card.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Text(
            'Ближайшие события',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
          ),
        ),
        Observer(builder: (context) {
          print('build: EventList');
          final eventsProvider = Provider.of<EventsState>(context);
          // print(
          //     'выбранная дата начала ${Provider.of<CommonState>(context).dateRange?.start.toString()}');
          // print(
          //     'выбранная дата конца ${Provider.of<CommonState>(context).dateRange?.end.toString()}');
          // print('количество событий: ${eventsProvider.events.length}');
          // print(
          //     'дата начала первого в списке события: ${eventsProvider.events[0].details?.dates?.from ?? 0}');
          // print(
          //     'дата конца первого в списке события: ${eventsProvider.events[0].details?.dates?.to ?? 0}');

          return eventsProvider.isLoading
              ? const Center(child: CircularProgressIndicator())
              : eventsProvider.hasError
                  ? Center(
                      child: Text(eventsProvider.error),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                      child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: eventsProvider.events.length,
                          itemBuilder: (context, index) {
                            print(' рисуем карточку события');

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed(
                                      AppNavRouteName.eventDetails,
                                      arguments: eventsProvider.events[index]);
                                },
                                child: EventCard(
                                  event: eventsProvider.events[index],
                                ),
                              ),
                            );
                          }),
                    );
        }),
      ],
    );
  }
}
