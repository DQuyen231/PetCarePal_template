import 'dart:convert';
import 'package:http/http.dart' as http;
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

Future<void> createPet(Map<String, dynamic> petData, int userId) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/ThuCung/$userId');

  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(petData),
  );

  if (response.statusCode == 201) {
    print('Pet created successfully');
  } else {
    throw Exception('Failed to create pet: ${response.statusCode}');
  }
}
