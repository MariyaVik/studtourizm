enum EntityFilter { dormitory, event, lab }

enum EventsFilter { all, science, culture, prof }

abstract class EventsFilterName {
  static const String scientific = 'scientific';
  static const String cultural = 'cultural';
  static const String proforientation = 'proforientation';
}
