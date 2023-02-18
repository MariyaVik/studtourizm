String getMealPlan(String plan) {
  switch (plan) {
    case 'breakfastAndDinner':
      return 'Завтрак и ужин';
    case 'full':
      return 'Полный пансион';
    case 'nothing':
      return 'Не включено';
    case 'breakfastOnly':
      return 'Только завтрак';
    default:
      return 'Не включено';
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
