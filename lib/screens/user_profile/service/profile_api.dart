import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileApi {
  Dio _dio = Dio();

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

  // Future<bool> isVip() async {
  //   int? user_id = await getUserId();

  //   final url = 'https://54.206.249.179/api/ThanhVienApp/user_id/${user_id}';

  //   final response = await _dio.get(url);

  //   try {
  //     if (response.statusCode == 200) {
  //       print(response);
  //       return true;
  //     } else if (response.data.isEmpty) {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return false;
  // }

  Future<bool> isVip() async {
    int? user_id = await getUserId();

    final url = 'https://54.206.249.179/api/ThanhVienApp/user_id/$user_id';

    try {
      final response = await _dio.get(url);

      if (response.statusCode == 200) {
        print(response);
        // Assuming the response data is a list
        if (response.data is List && response.data.isEmpty) {
          return false;
        } else {
          return true;
        }
      } else {
        // Handle other status codes if necessary
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false; // Return false if there's any error
    }
  }
}
