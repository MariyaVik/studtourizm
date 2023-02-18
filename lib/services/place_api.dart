import 'package:dio/dio.dart';
import '../models/place/place.dart';

class PlaceAPI {
  final Dio dio = Dio();

  Future<List<Place>> getAllPlaces() async {
    try {
      final response = await dio
          .get('https://montizar.ru/api/dormitori.php?function=dormitori');
      // final List data = response.data.sublist(0, 20);
      final List<Place> places =
          response.data.map<Place>((e) => Place.fromJson(e)).toList();
      return places;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Place>> getPlacesNearEvent(String eventId) async {
    try {
      final response = await dio.get(
          'https://montizar.ru/api/event.php?function=sobitie&id=${eventId}');
      final List<Place> places =
          response.data.map<Place>((e) => Place.fromJson(e)).toList();
      return places;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }

  Future<List<Place>> getPlacesNearUser(double lat, double long) async {
    try {
      final response = await dio.get(
          'https://montizar.ru/api/dormitori.php?function=blizko&geo_lat=${lat}geo_lon=${long}');
      final List<Place> places =
          response.data.map<Place>((e) => Place.fromJson(e)).toList();
      return places;
    } on DioError catch (e) {
      throw 'Something went wrong :(\n ${e.message}';
    }
  }
}
