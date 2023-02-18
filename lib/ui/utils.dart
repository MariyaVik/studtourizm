import '../models/filter/filter.dart';

String getMealPlan(String plan) {
  switch (plan) {
    case 'breakfastAndDinner':
      return MealFilterName.breakfastAndDinner;
    case 'full':
      return MealFilterName.full;
    case 'nothing':
      return MealFilterName.nothing;
    case 'breakfastOnly':
      return MealFilterName.breakfastOnly;
    default:
      return MealFilterName.nothing;
  }
}

String getPrice(String price) {
  if (price == '0') {
    return 'Бесплатно';
  } else {
    return '$price ₽';
  }
}

String dateFormat(DateTime time) {
  String year = time.year.toString();

  String month = time.month.toString().padLeft(2, '0');

  String day = time.day.toString().padLeft(2, '0');
  return "$day.$month.$year";
}

String getEventType(String type) {
  switch (type) {
    case EventsFilterName.scientific:
      return 'Научно-популярные';
    case EventsFilterName.cultural:
      return 'Культурно-познавательные';
    case EventsFilterName.proforientation:
      return 'Профориентационные';
    default:
      return 'Научно-популярные';
  }
}
