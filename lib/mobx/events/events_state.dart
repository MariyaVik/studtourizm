import 'package:mobx/mobx.dart';

import '../../models/event/event.dart';
import '../../services/events_api.dart';

part 'events_state.g.dart';

class EventsState = _EventsState with _$EventsState;

abstract class _EventsState with Store {
  final EventsAPI eventsRepository;

  @observable
  List<Event> events = [];

  _EventsState(this.eventsRepository) {
    loadAllEvents();
  }

  @observable
  String error = '';

  @computed
  bool get isLoading => events.isEmpty && !hasError;
  @computed
  bool get hasError => error != '';

  @action
  Future<void> loadEvents({int from = 0, int to = 0}) async {
    if (from == 0 || to == 0) {
      await loadAllEvents();
    } else {
      await loadAEventsInDate(from, to);
    }
  }

  @action
  Future<void> loadAllEvents() async {
    print('все события');
    events = await eventsRepository
        .getAllEvents()
        .then((events) => events)
        .catchError((e) {
      error = e.toString();
      print(error);
      return <Event>[];
    });
  }

  @action
  Future<void> loadAEventsInDate(int from, int to) async {
    print('по дате');
    events = await eventsRepository
        .getEventsInDateRande(from, to)
        .then((events) => events)
        .catchError((e) {
      error = e.toString();
      print(error);
      return <Event>[];
    });
  }
}
