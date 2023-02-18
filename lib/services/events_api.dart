import 'package:dio/dio.dart';

import '../models/event/event.dart';

class EventsAPI {
  final Dio dio = Dio();

  Future<List<Event>> getAllEvents() async {
    try {
      final response = await dio.get('https://montizar.ru/api/event.php');
      final List<Event> events =
          response.data.map<Event>((e) => Event.fromJson(e)).toList();
      return events.sublist(0, 10);
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}
