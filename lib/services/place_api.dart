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
}
