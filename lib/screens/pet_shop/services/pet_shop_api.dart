import 'package:dio/dio.dart';

import 'package:petcarepal/screens/pet_shop/models/product.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PetShopApi {
  final Dio _dio = Dio();

  Future<List<ProductModelTest>> getProducts() async {
    try {
      final response = await _dio.get('https://54.206.249.179/api/SanPham');

      if (response.statusCode == 200) {
        final List<dynamic> productItems = response.data;

        // print(productItems);
        return productItems
            .map((item) => ProductModelTest.fromJson(item))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      print(e.toString());
      throw Exception('Failed to load products');
    }
  }

  Future<void> createShoppingCart(cart) async {
    final Dio _dio = Dio();
    final id = await _getUserIdFromLocalStorage();

    print(cart);
    print(id);

    final response = await _dio
        .post('https://54.206.249.179/api/SPGioHang/${id}', data: cart);
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

Future<int?> _getUserIdFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('userId');
}
