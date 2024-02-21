// appointment_info_widget.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AppointmentInfoWidget extends StatefulWidget {
  const AppointmentInfoWidget({super.key});

  @override
  State<AppointmentInfoWidget> createState() => _AppointmentInfoWidgetState();
}

class Appointments {
  int id;
  int thuCungId;
  bool isDeleted;
  bool isCompleted;
  int? thuocId;
  Thuoc? thuoc;
  int? tiemChungId;
  TiemChung? tiemChung;

  Appointments({
    required this.id,
    required this.thuCungId,
    required this.isDeleted,
    required this.isCompleted,
    this.thuocId,
    this.thuoc,
    this.tiemChungId,
    this.tiemChung,
  });

  factory Appointments.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      // Handle a single appointment
      return Appointments(
        id: json["Id"],
        thuCungId: json["ThuCungId"],
        isDeleted: json["IsDeleted"],
        isCompleted: json["IsCompleted"],
        thuocId: json["ThuocId"],
        thuoc: json["Thuoc"] == null ? null : Thuoc.fromJson(json["Thuoc"]),
        tiemChungId: json["TiemChungId"],
        tiemChung: json["TiemChung"] == null
            ? null
            : TiemChung.fromJson(json["TiemChung"]),
      );
    } else if (json is List<dynamic>) {
      // Handle a list of appointments
      return Appointments(
          id: -1, thuCungId: -1, isDeleted: false, isCompleted: false);
    } else {
      throw Exception('Invalid JSON format for appointments');
    }
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ThuCungId": thuCungId,
        "IsDeleted": isDeleted,
        "IsCompleted": isCompleted,
        "ThuocId": thuocId,
        "Thuoc": thuoc?.toJson(),
        "TiemChungId": tiemChungId,
        "TiemChung": tiemChung?.toJson(),
      };
}

class Thuoc {
  int id;
  String ten;
  int soLanUongTrongNgay;
  int soVienUong;
  String thoiGianSuDung;
  DateTime ngayBatDau;
  DateTime ngayKetThuc;

  Thuoc({
    required this.id,
    required this.ten,
    required this.soLanUongTrongNgay,
    required this.soVienUong,
    required this.thoiGianSuDung,
    required this.ngayBatDau,
    required this.ngayKetThuc,
  });

  factory Thuoc.fromJson(Map<String, dynamic> json) => Thuoc(
        id: json["id"],
        ten: json["ten"],
        soLanUongTrongNgay: json["soLanUongTrongNgay"],
        soVienUong: json["soVienUong"],
        thoiGianSuDung: json["thoiGianSuDung"],
        ngayBatDau: DateTime.parse(json["ngayBatDau"]),
        ngayKetThuc: DateTime.parse(json["ngayKetThuc"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten,
        "soLanUongTrongNgay": soLanUongTrongNgay,
        "soVienUong": soVienUong,
        "thoiGianSuDung": thoiGianSuDung,
        "ngayBatDau": ngayBatDau.toIso8601String(),
        "ngayKetThuc": ngayKetThuc.toIso8601String(),
      };
}

class TiemChung {
  int id;
  String mucDich;
  String phongKham;
  DateTime ngayKham;

  TiemChung({
    required this.id,
    required this.mucDich,
    required this.phongKham,
    required this.ngayKham,
  });

  factory TiemChung.fromJson(Map<String, dynamic> json) => TiemChung(
        id: json["id"],
        mucDich: json["mucDich"],
        phongKham: json["phongKham"],
        ngayKham: DateTime.parse(json["ngayKham"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mucDich": mucDich,
        "phongKham": phongKham,
        "ngayKham": ngayKham.toIso8601String(),
      };
}

Future<List<Appointments>> fetchAppointments() async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/api/Lich/lichs/4'));

  if (response.statusCode == 200) {
    // Parse the response as a List<dynamic>
    List<dynamic> data = jsonDecode(response.body);

    // Map each element in the list to an Appointments object
    List<Appointments> appointmentsList =
        data.map((json) => Appointments.fromJson(json)).toList();

    return appointmentsList;
  } else {
    throw Exception('Failed to load appointments');
  }
}

class _AppointmentInfoWidgetState extends State<AppointmentInfoWidget> {
  late Future<List<Appointments>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Appointments>>(
      future: futureAppointments,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                snapshot.data![0].thuoc!.ten,
                style: TextStyle(
                  color: Color(0xFF070821),
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Khám da liễu',
                style: TextStyle(
                  color: Color(0xFF070821),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                height: 26,
              ),
            ],
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
