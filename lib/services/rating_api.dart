import 'package:dio/dio.dart';

final Dio dio = Dio();

Future getRating() async {
  try {
    final response = await dio.get('https://montizar.ru/api/rating.php');
    final rating = response.data[0];
    return rating;
  } on DioError catch (e) {
    throw 'Something went wrong :(\n ${e.message}';
  }
}
