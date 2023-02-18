import 'package:dio/dio.dart';

import '../models/event/event.dart';

class EventsAPI {
  final Dio dio = Dio();

  Future<List<Event>> getAllEvents() async {
    try {
      final response =
          await dio.get('https://montizar.ru/api/event.php?function=event');
      final List<Event> events =
          response.data.map<Event>((e) => Event.fromJson(e)).toList();
      return events;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Event>> getEventsInDateRande(int from, int to) async {
    try {
      final response = await dio.get(
          'https://montizar.ru/api/event.php?function=to_from&data_to=${to}&data_from=${from}');
      final List<Event> events =
          response.data.map<Event>((e) => Event.fromJson(e)).toList();
      return events;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}
