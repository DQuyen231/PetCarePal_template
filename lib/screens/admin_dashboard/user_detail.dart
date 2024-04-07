import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<User> fetchUser(int userId) async {
  final apiUrl = 'https://54.206.249.179/api/User/$userId';

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    Map<String, dynamic> userData = jsonDecode(response.body);
    return User.fromJson(userData);
  } else {
    throw Exception('Failed to load user');
  }
}

class User {
  int id;
  String userName;
  String password;
  String role;
  dynamic ho;
  String ten;
  dynamic sdt;
  dynamic diaChi;

  User({
    required this.id,
    required this.userName,
    required this.password,
    required this.role,
    required this.ho,
    required this.ten,
    required this.sdt,
    required this.diaChi,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        userName: json["userName"],
        password: json["password"],
        role: json["role"],
        ho: json["ho"],
        ten: json["ten"],
        sdt: json["sdt"],
        diaChi: json["diaChi"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userName": userName,
        "password": password,
        "role": role,
        "ho": ho,
        "ten": ten,
        "sdt": sdt,
        "diaChi": diaChi,
      };
}

class UserDetailPage extends StatefulWidget {
  final int userId;
  const UserDetailPage({Key? key, required this.userId}) : super(key: key);

  @override
  _UserDetailPageState createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi tiết khách hàng',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<User>(
        future: fetchUser(widget.userId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            User user = snapshot.data!;
            return Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildUserInfoRow('Username', user.userName),
                  _buildUserInfoRow('Họ', user.ho),
                  _buildUserInfoRow('Tên', user.ten),
                  _buildUserInfoRow('Số điện thoại', user.sdt),
                  _buildUserInfoRow('Địa chỉ', user.diaChi),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Không thể tải thông tin người dùng.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                ),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Widget _buildUserInfoRow(String label, dynamic value) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              value != null ? value.toString() : 'N/A',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
