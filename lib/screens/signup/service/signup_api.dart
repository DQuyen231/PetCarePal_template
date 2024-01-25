import 'package:dio/dio.dart';

class SignUpService {
  final Dio _dio = Dio();
  Future<void> signUp(Object user) async {
    try {
      Response response = await _dio.post(
        'https://54.206.249.179/api/User/register',
        data: user,
      );
      print(response);
    } catch (e) {
      print(e.toString());
    }
  }
}
