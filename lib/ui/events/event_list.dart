import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../mobx/events/events_state.dart';
import '../../mobx/places/places_state.dart';
import '../../models/event/event.dart';
import '../navigation.dart';
import 'event_card.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({required this.controller, super.key});
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      physics: const ScrollPhysics(),
      child: Column(
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

            return eventsProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : eventsProvider.hasError
                    ? Center(
                        child: Text(eventsProvider.error),
                      )
                    : Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        AppNavRouteName.eventDetails,
                                        arguments:
                                            eventsProvider.events[index]);
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
      ),
    );
  }
}
