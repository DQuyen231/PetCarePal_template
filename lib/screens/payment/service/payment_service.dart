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

  Future<void> updateOrder(order_id, content) async {
    final reqBody = {"trangThai": false, "noiDung": content};

    final url = 'https://54.206.249.179/order/${order_id}';

    final response = await _dio.put(url, data: reqBody);

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

  Future<void> updateAccount(user_id) async {
    final url = 'https://54.206.249.179/api/ThanhVienApp?user_id=${user_id}';

    final response = await _dio.post(url);

    try {
      if (response.statusCode == 200) {
        print('success');
      } else {
        print(response);
        print('error here');
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
        final order_id = response.data['id'];
        updateOrder(order_id, 'PETCAREPAL TTOAN SP09');
        updateAccount(user_id);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> createOrderByMoMo(user_id) async {
    const reqBody = {"phuongThucThanhToan": "MOMO", "diaChi": "PetCarePal"};

    final url = 'https://54.206.249.179/order/${user_id}';
    // final url_put = 'https://54.206.249.179/order/${order_id}';

    final response = await _dio.post(url, data: reqBody);

    try {
      if (response.statusCode == 200) {
        print('success');
      } else {
        print(response);
        final order_id = response.data['id'];
        final user_id = response.data['userId'];
        updateOrder(order_id, 'PETCAREPAL TTOAN SP10');
        updateAccount(user_id);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
