import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/user_order_history/user_order_history_detail.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<int> getUserIDFromLocalStorage() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int? userID = prefs.getInt('userId');
  if (userID != null) {
    return userID;
  } else {
    throw Exception('UserID not found in localStorage');
  }
}

Future<List<UserOrders>> fetchUserOrders(int userId) async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/order/$userId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<UserOrders> userOrders =
        data.map((json) => UserOrders.fromJson(json)).toList();
    return userOrders;
  } else {
    throw Exception('Failed to load UserOrders or no UserOrders found');
  }
}

class UserOrders {
  int id;
  int userId;
  String phuongThucThanhToan;
  String diaChi;
  double tongSoTien;
  dynamic noiDung;
  bool trangThai;
  DateTime ngayOrder;

  UserOrders({
    required this.id,
    required this.userId,
    required this.phuongThucThanhToan,
    required this.diaChi,
    required this.tongSoTien,
    required this.noiDung,
    required this.trangThai,
    required this.ngayOrder,
  });

  factory UserOrders.fromJson(Map<String, dynamic> json) => UserOrders(
        id: json["id"],
        userId: json["userId"],
        phuongThucThanhToan: json["phuongThucThanhToan"],
        diaChi: json["diaChi"],
        tongSoTien: json["tongSoTien"]?.toDouble() ?? 0.0,
        noiDung: json["noiDung"],
        trangThai: json["trangThai"],
        ngayOrder:
            DateFormat("yyyy-MM-ddTHH:mm:ss.SSS").parse(json["ngayOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "phuongThucThanhToan": phuongThucThanhToan,
        "diaChi": diaChi,
        "tongSoTien": tongSoTien,
        "noiDung": noiDung,
        "trangThai": trangThai,
        "ngayOrder": ngayOrder.toIso8601String(),
      };
}

void main() => runApp(const UserOrderHistory());

class UserOrderHistory extends StatefulWidget {
  const UserOrderHistory({super.key});

  @override
  State<UserOrderHistory> createState() => _UserOrderState();
}

class _UserOrderState extends State<UserOrderHistory> {
  Future<List<UserOrders>>? futureUserOrders; // Loại bỏ late modifier

  @override
  void initState() {
    super.initState();
    _initializeUserOrders();
  }

  Future<void> _initializeUserOrders() async {
    try {
      final userId = await getUserIDFromLocalStorage();
      setState(() {
        futureUserOrders = fetchUserOrders(userId);
      });
    } catch (error) {
      print('Error initializing user orders: $error');
      setState(() {
        futureUserOrders = Future.error(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lịch sử giao dịch',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: FutureBuilder<List<UserOrders>>(
          future: futureUserOrders,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  'Chưa có lịch sử giao dịch',
                  style: TextStyle(color: Colors.blue, fontSize: 20),
                ),
              );
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final order = snapshot.data![index];
                  String formattedDate =
                      DateFormat('dd/MM/yyyy HH:mm').format(order.ngayOrder);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              UserOrderHistoryDetailPage(order: order),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mã đơn hàng: ${order.id}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Ngày đặt hàng: $formattedDate',
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Text(
                'Không có dữ liệu',
                style: TextStyle(fontSize: 16),
              );
            }
          },
        ),
      ),
    );
  }
}
