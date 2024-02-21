import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/components/circle_avatar_widget.dart';

// Define a model class for completed appointments

class DoneTab extends StatefulWidget {
  const DoneTab({Key? key}) : super(key: key);

  @override
  _DoneTabState createState() => _DoneTabState();
}

Future<List<Appointments>> fetchAppointments() async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/api/Lich/lichs/4'));

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Appointments> appointmentsList = data
        .map((json) => Appointments.fromJson(json))
        .where(
            (appointment) => appointment.isCompleted) // Lọc lịch đã hoàn thành
        .toList();
    return appointmentsList;
  } else {
    throw Exception('Failed to load appointments');
  }
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

class _DoneTabState extends State<DoneTab> {
  late Future<List<Appointments>> futureAppointments;

  @override
  void initState() {
    super.initState();
    futureAppointments = fetchAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 227, 243, 1),
      child: FutureBuilder<List<Appointments>>(
        future: futureAppointments,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final appointment = snapshot.data![index];
                      if (appointment.thuoc != null) {
                        return _buildListItem(
                          context,
                          appointment.thuoc!,
                          'Thuốc',
                        );
                      } else if (appointment.tiemChung != null) {
                        return _buildListItem(
                          context,
                          appointment.tiemChung!,
                          'Tiêm chủng',
                        );
                      }
                      return SizedBox();
                    },
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget _buildListItem(BuildContext context, dynamic appointment, String type) {
  if (type == 'Thuốc') {
    final thuoc = appointment as Thuoc;
    return _buildMedicationAppointment(context, thuoc);
  } else if (type == 'Tiêm chủng') {
    final tiemChung = appointment as TiemChung;
    return _buildVaccinationAppointment(context, tiemChung);
  }
  return SizedBox();
}

Widget _buildMedicationAppointment(BuildContext context, Thuoc thuoc) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(thuoc.ten),
                Text('Loại lịch: Thuốc'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Số lần uống trong ngày: ${thuoc.soLanUongTrongNgay}'),
                    Text('Số viên uống: ${thuoc.soVienUong}'),
                    Text('Thời gian sử dụng: ${thuoc.thoiGianSuDung}'),
                    Text(
                        'Ngày bắt đầu: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayBatDau)}'),
                    Text(
                        'Ngày kết thúc: ${DateFormat('dd/MM/yyyy').format(thuoc.ngayKetThuc)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildVaccinationAppointment(BuildContext context, TiemChung tiemChung) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Color(0x0A2E1E7A),
          blurRadius: 12,
          offset: Offset(5, 3),
          spreadRadius: 0,
        ),
      ],
    ),
    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatarWidget(),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tiemChung.mucDich),
                Text('Loại lịch: Tiêm chủng'),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phòng khám: ${tiemChung.phongKham}'),
                    Text(
                        'Ngày khám: ${DateFormat('dd/MM/yyyy').format(tiemChung.ngayKham)}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
