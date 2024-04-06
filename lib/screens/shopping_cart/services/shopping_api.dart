import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShoppingApi {
  Dio _dio = Dio();

  Future<List<dynamic>> getCart() async {
    final id = await _getUserIdFromLocalStorage();

    try {
      final response =
          await _dio.get('https://54.206.249.179/api/SPGioHang/${id}');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }

    return [];
  }

  Future<void> payment(phuongthuc, address) async {
    final id = await _getUserIdFromLocalStorage();
    final requestBody = {'PhuongThucThanhToan': phuongthuc, 'diaChi': address};
    try {
      final response = await _dio.post('https://54.206.249.179/order/${id}',
          data: requestBody);
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> updateCart(id, quantity) async {
    final url =
        'https://54.206.249.179/api/SPGioHang/${id}?so_luong=${quantity}';
    try {
      final response = await _dio.put(url);
      print(response);
      print('successs');
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<int?> _getUserIdFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('userId');
}
