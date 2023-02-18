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
    loadEvents();
  }

  @observable
  String error = '';

  @computed
  bool get isLoading => events.isEmpty && !hasError;
  @computed
  bool get hasError => error != '';

  @action
  Future<void> loadEvents() async {
    events = await eventsRepository
        .getAllEvents()
        .then((places) => places)
        .catchError((e) {
      error = e.toString();
      print(error);
      return <Event>[];
    });
  }
}
