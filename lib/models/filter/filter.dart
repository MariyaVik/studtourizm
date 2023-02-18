enum EntityFilter { dormitory, event, lab }

enum EventsFilter { all, science, culture, prof }

abstract class EventsFilterName {
  static const String scientific = 'scientific';
  static const String cultural = 'cultural';
  static const String proforientation = 'proforientation';
}

enum MealFilter { breakfastAndDinner, full, breakfastOnly, nothing }

abstract class MealFilterName {
  static const String breakfastAndDinner = 'Завтрак и ужин';
  static const String full = 'Полный пансион';
  static const String breakfastOnly = 'Только завтрак';
  static const String nothing = 'Не включено';
  static const List<String> list = [
    breakfastAndDinner,
    full,
    breakfastOnly,
    nothing
  ];
}
