import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';
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

Future<List<Appointments>> fetchUncompletedAppointments(int userId) async {
  final response = await http
      .get(Uri.parse('https://54.206.249.179/api/Lich/lichs/$userId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Appointments> appointmentsList = data
        .map((json) => Appointments.fromJson(json))
        .where((appointment) =>
            !appointment.isCompleted) // Lọc lịch chưa hoàn thành
        .toList();
    return appointmentsList;
  } else {
    throw Exception('Failed to load appointments');
  }
}

Future<List<Appointments>> fetchCompletedAppointments(int userId) async {
  final response = await http
      .get(Uri.parse('https://54.206.249.179/api/Lich/lichs/$userId'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Appointments> appointmentsList = data
        .map((json) => Appointments.fromJson(json))
        .where((appointment) =>
            appointment.isCompleted) // Lọc lịch chưa hoàn thành
        .toList();
    return appointmentsList;
  } else {
    throw Exception('Failed to load appointments');
  }
}

Future<void> deleteMedicationAppointment(int thuocId) async {
  final http.Response response = await http.delete(
    Uri.parse('https://54.206.249.179/api/Lich/thuoc/$thuocId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('Appointment deleted successfully');
  } else {
    throw Exception('Failed to delete appointment with id: $thuocId');
  }
}

Future<void> deleteVaccinationAppointment(int tiemChungId) async {
  final http.Response response = await http.delete(
    Uri.parse('https://54.206.249.179/api/Lich/tiemChung/$tiemChungId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('Appointment deleted successfully');
  } else {
    throw Exception('Failed to delete appointment with id: $tiemChungId');
  }
}

Future<void> deleteMealAppointment(int buaAnId) async {
  final http.Response response = await http.delete(
    Uri.parse('https://54.206.249.179/api/Lich/buaAn/$buaAnId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('Appointment deleted successfully');
  } else {
    throw Exception('Failed to delete appointment with id: $buaAnId');
  }
}

Future<void> deleteSizeAppointment(int doKichThuocId) async {
  final http.Response response = await http.delete(
    Uri.parse('https://54.206.249.179/api/Lich/doKichThuoc/$doKichThuocId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    print('Appointment deleted successfully');
  } else {
    throw Exception('Failed to delete appointment with id: $doKichThuocId');
  }
}

Future<void> updateMedication(int medicationId, String ten, int soLan,
    int soVien, String thoiGian, String ngayBatDau, String ngayKetThuc) async {
  final Uri uri =
      Uri.parse('https://54.206.249.179/api/Lich/thuoc/$medicationId');
  final Map<String, dynamic> requestData = {
    'ten': ten,
    'soLanUongTrongNgay': soLan,
    'soVienUong': soVien,
    'thoiGianSuDung': thoiGian,
    'ngayBatDau': ngayBatDau,
    'ngayKetThuc': ngayKetThuc,
  };
  final http.Response response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );
  if (response.statusCode == 200) {
    print('Medication updated successfully');
  } else {
    throw Exception('Failed to update medication: ${response.statusCode}');
  }
}

Future<void> updateVaccination(int vaccinationId, String mucDich,
    String phongKham, String ngayKham) async {
  final Uri uri =
      Uri.parse('https://54.206.249.179/api/Lich/tiemChung/$vaccinationId');
  final Map<String, dynamic> requestData = {
    'mucDich': mucDich,
    'phongKham': phongKham,
    'ngayKham': ngayKham,
  };
  final http.Response response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );
  if (response.statusCode == 200) {
    print('Vaccination updated successfully');
  } else {
    throw Exception('Failed to update vaccination: ${response.statusCode}');
  }
}

Future<void> updateMeal(int mealId, String name, String loai, String cachDung,
    String ngayBatDau, String ngayKetThuc) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/Lich/buaAn/$mealId');
  final Map<String, dynamic> requestData = {
    'name': name,
    'loai': loai,
    'cachDung': cachDung,
    'ngayBatDau': ngayBatDau,
    'ngayKetThuc': ngayKetThuc,
  };
  final http.Response response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );
  if (response.statusCode == 200) {
    print('Meal updated successfully');
  } else {
    throw Exception('Failed to update meal: ${response.statusCode}');
  }
}

Future<void> updateSize(
    int sizeId, int chieuCao, int canNang, String thoiGianDo) async {
  final Uri uri =
      Uri.parse('https://54.206.249.179/api/Lich/doKichThuoc/$sizeId');
  final Map<String, dynamic> requestData = {
    'chieuCao': chieuCao,
    'canNang': canNang,
    'thoiGianDo': thoiGianDo,
  };
  final http.Response response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );
  if (response.statusCode == 200) {
    print('Size updated successfully');
  } else {
    throw Exception('Failed to update size: ${response.statusCode}');
  }
}

Future<void> createMedication(Map<String, dynamic> medicationData) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/Lich/thuoc/5');

  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(medicationData),
  );

  if (response.statusCode == 201) {
    print('Medication created successfully');
  } else {
    throw Exception('Failed to create medication: ${response.statusCode}');
  }
}

Future<void> createVaccination(Map<String, dynamic> vaccinationData) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/Lich/tiemChung/5');

  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(vaccinationData),
  );

  if (response.statusCode == 201) {
    print('Vaccination created successfully');
  } else {
    throw Exception('Failed to create vaccination: ${response.statusCode}');
  }
}

Future<void> createMeal(Map<String, dynamic> mealData) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/Lich/buaAn/5');

  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(mealData),
  );

  if (response.statusCode == 201) {
    print('Meal created successfully');
  } else {
    throw Exception('Failed to create meal: ${response.statusCode}');
  }
}

Future<void> createSize(Map<String, dynamic> sizeData) async {
  final Uri uri = Uri.parse('https://54.206.249.179/api/Lich/doKichThuoc/5');

  final http.Response response = await http.post(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(sizeData),
  );

  if (response.statusCode == 201) {
    print('Size created successfully');
  } else {
    throw Exception('Failed to create size: ${response.statusCode}');
  }
}

Future<void> updateAppointmentStatus(
    int appointmentId, bool isCompleted) async {
  final Uri uri =
      Uri.parse('https://54.206.249.179/api/Lich/lich/$appointmentId');
  final Map<String, dynamic> requestData = {
    'IsCompleted': isCompleted,
  };

  final http.Response response = await http.put(
    uri,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestData),
  );

  if (response.statusCode == 200) {
    print('Appointment status updated successfully');
  } else {
    throw Exception(
        'Failed to update appointment status: ${response.statusCode}');
  }
}
