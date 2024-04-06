import 'package:dio/dio.dart';

class PaymentApi {
  final Dio _dio = Dio();

  Future<void> buyPremiumAccount(user_id) async {
    const reqBody = {
      "sanPhamId": 18,
      "soLuong": 1,
    };

    final response = await _dio
        .post('https://54.206.249.179/api/SPGioHang/${user_id}', data: reqBody);
    try {
      if (response.statusCode == 200) {
        print('success');
      } else {
        print(response);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createOrder(user_id) async {
    const reqBody = {
      "phuongThucThanhToan": "Internet Banking",
      "diaChi": "PetCarePal"
    };

    final url = 'https://54.206.249.179/order/${user_id}';

    final response = await _dio.post(url, data: reqBody);

    try {
      if (response.statusCode == 200) {
        print('success');
      } else {
        print(response);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
