import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:petcarepal/screens/admin_dashboard/order.dart';

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

  Future<dynamic> getItemOrder(id) async {
    try {
      final response = await _dio.get('https://54.206.249.179/sp_order/${id}');
      print(response.data);
      return response.data;
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<List<Order>> fetchAcceptedOrder() async {
  final response = await http.get(Uri.parse('https://54.206.249.179/orders'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Order> orderList = data
        .map((json) => Order.fromJson(json))
        .where((order) => order.trangThai == true)
        .toList();
    return orderList;
  } else {
    throw Exception('Failed to load orders');
  }
}

Future<List<Order>> fetchPendingOrder() async {
  final response = await http.get(Uri.parse('https://54.206.249.179/orders'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Order> orderList = data
        .map((json) => Order.fromJson(json))
        .where((order) => order.trangThai == false)
        .toList();
    return orderList;
  } else {
    throw Exception('Failed to load orders');
  }
}

Future<List<OrderDetails>> fetchOrderDetails(int orderId) async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/sp_order/$orderId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<OrderDetails> orderList =
        data.map((json) => OrderDetails.fromJson(json)).toList();
    return orderList;
  } else {
    throw Exception('Failed to load orders');
  }
}
