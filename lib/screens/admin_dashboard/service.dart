import 'package:dio/dio.dart';

class AdminApi {
  final Dio _dio = Dio();

  Future<List<dynamic>> getCart() async {
    try {
      final response = await _dio.get('https://54.206.249.179/orders');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }

    return [];
  }
}
