import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final Dio _dio = Dio();

  AuthService();

  Future<void> signIn(BuildContext context, Object user) async {
    try {
      final response = await _dio.post(
        'https://54.206.249.179/api/User/login',
        data: user,
      );

      print('asdasdsad');
      if (response.statusCode == 200) {
        final userId = response.data['user']['id'];
        final token = response.data['token'];

        await _saveUserIdToLocalStorage(userId);
        await _saveTokenToLocalStorage(token);

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

Future<void> _saveUserIdToLocalStorage(int userId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setInt('userId', userId);
}

Future<void> _saveTokenToLocalStorage(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('token', token);
}
