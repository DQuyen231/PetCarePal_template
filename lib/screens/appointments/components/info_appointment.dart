import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'circle_avatar_widget.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class InfoAppointment extends StatefulWidget {
  const InfoAppointment({Key? key}) : super(key: key);

  @override
  State<InfoAppointment> createState() => _InfoAppointmentState();
}

Future<List<Appointments>> fetchAppointments() async {
  final response =
      await http.get(Uri.parse('https://54.206.249.179/api/Lich/lichs/4'));

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

Future<void> deleteAppointment(int thuocId) async {
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

class _InfoAppointmentState extends State<InfoAppointment> {
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
          checkAndUpdateStatus(snapshot.data!);
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
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChooseAppointmentTypeScreen(),
                      ),
                    );
                  },
                  child: Text('Tạo lịch mới'),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return Center(child: CircularProgressIndicator());
      },
    );
  }

  Widget _buildListItem(
      BuildContext context, dynamic appointment, String type) {
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
                      Text(
                          'Số lần uống trong ngày: ${thuoc.soLanUongTrongNgay}'),
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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () async {
                    try {
                      await deleteAppointment(thuoc.id);
                      setState(() {
                        futureAppointments = fetchAppointments();
                      });
                    } catch (e) {
                      print('Error deleting appointment: $e');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {
                    _navigateToEditMedicationScreen(context, thuoc);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildVaccinationAppointment(
      BuildContext context, TiemChung tiemChung) {
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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromRGBO(240, 240, 248, 1),
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  ),
                  child: const Text(
                    'Xóa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 15),
              SizedBox(
                width: 153.2,
                height: 34,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Chỉnh sửa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToEditMedicationScreen(
      BuildContext context, Thuoc thuoc) async {
    final updatedMedication = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditMedicationScreen(thuoc: thuoc),
      ),
    );

    if (updatedMedication != null) {
      try {
        await updateMedication(
          thuoc.id,
          updatedMedication['ten'],
          updatedMedication['soLan'],
          updatedMedication['soVien'],
          updatedMedication['thoiGian'],
          updatedMedication['ngayBatDau'],
          updatedMedication['ngayKetThuc'],
        );
        setState(() {
          futureAppointments = fetchAppointments();
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Thông tin thuốc đã được cập nhật thành công'),
          ),
        );
      } catch (e) {
        print('Error updating medication: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đã xảy ra lỗi khi cập nhật thông tin thuốc'),
          ),
        );
      }
    }
  }
}

class EditMedicationScreen extends StatefulWidget {
  final Thuoc thuoc;

  const EditMedicationScreen({Key? key, required this.thuoc}) : super(key: key);

  @override
  _EditMedicationScreenState createState() => _EditMedicationScreenState();
}

class _EditMedicationScreenState extends State<EditMedicationScreen> {
  late TextEditingController _tenController;
  late TextEditingController _soLanController;
  late TextEditingController _soVienController;
  late TextEditingController _thoiGianController;
  late TextEditingController _ngayBatDauController;
  late TextEditingController _ngayKetThucController;

  @override
  void initState() {
    super.initState();
    _tenController = TextEditingController(text: widget.thuoc.ten);
    _soLanController =
        TextEditingController(text: widget.thuoc.soLanUongTrongNgay.toString());
    _soVienController =
        TextEditingController(text: widget.thuoc.soVienUong.toString());
    _thoiGianController =
        TextEditingController(text: widget.thuoc.thoiGianSuDung);
    _ngayBatDauController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.thuoc.ngayBatDau));
    _ngayKetThucController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.thuoc.ngayKetThuc));
  }

  @override
  void dispose() {
    _tenController.dispose();
    _soLanController.dispose();
    _soVienController.dispose();
    _thoiGianController.dispose();
    _ngayBatDauController.dispose();
    _ngayKetThucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa thuốc'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _tenController,
              decoration: InputDecoration(labelText: 'Tên thuốc'),
            ),
            TextField(
              controller: _soLanController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số lần uống trong ngày'),
            ),
            TextField(
              controller: _soVienController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số viên uống'),
            ),
            TextField(
              controller: _thoiGianController,
              decoration: InputDecoration(labelText: 'Thời gian sử dụng'),
            ),
            TextField(
              controller: _ngayBatDauController,
              readOnly: true,
              onTap: () => _selectStartDate(context),
              decoration: InputDecoration(labelText: 'Ngày bắt đầu'),
            ),
            TextField(
              controller: _ngayKetThucController,
              readOnly: true,
              onTap: () => _selectEndDate(context),
              decoration: InputDecoration(labelText: 'Ngày kết thúc'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.thuoc.ngayBatDau,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.thuoc.ngayBatDau)
      setState(() {
        _ngayBatDauController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.thuoc.ngayKetThuc,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.thuoc.ngayKetThuc)
      setState(() {
        _ngayKetThucController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() {
    final updatedMedication = {
      'ten': _tenController.text,
      'soLan': int.parse(_soLanController.text),
      'soVien': int.parse(_soVienController.text),
      'thoiGian': _thoiGianController.text,
      'ngayBatDau': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_ngayBatDauController.text),
      ),
      'ngayKetThuc': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_ngayKetThucController.text),
      ),
    };
    Navigator.pop(context, updatedMedication);
  }
}

class ChooseAppointmentTypeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chọn loại lịch',
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
        iconTheme: IconThemeData(color: Color(0xFF4552CB)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateMedicationAppointmentScreen(),
                ),
              );
            },
            child: Container(
              width: 500,
              height: 130,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/thuoc.png'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Thuốc',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Quản lí sức khỏe\n loại thuốc chức năng',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateVaccinationAppointmentScreen(),
                ),
              );
            },
            child: Container(
              width: 500,
              height: 130,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/tiemchung.png'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tiêm chủng',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Quản lí thời gian\n loại vaccin cho thú cưng',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateMealAppointmentScreen(),
                ),
              );
            },
            child: Container(
              width: 500,
              height: 130,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/dinhduong.png'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dinh dưỡng',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Quản lí chế độ dinh dưỡng',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CreateMeasurementAppointmentScreen(),
                ),
              );
            },
            child: Container(
              width: 500,
              height: 130,
              margin: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/images/dalieu.png'),
                      fit: BoxFit.cover)),
              child: Container(
                margin: EdgeInsets.only(left: 30, top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Đo kích thước',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Chăm sóc, spa cho thú cưng',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CreateMedicationAppointmentScreen extends StatefulWidget {
  @override
  _CreateMedicationAppointmentScreenState createState() =>
      _CreateMedicationAppointmentScreenState();
}

class _CreateMedicationAppointmentScreenState
    extends State<CreateMedicationAppointmentScreen> {
  late TextEditingController _tenController;
  late TextEditingController _soLanController;
  late TextEditingController _soVienController;
  late TextEditingController _thoiGianController;
  late TextEditingController _ngayBatDauController;
  late TextEditingController _ngayKetThucController;

  @override
  void initState() {
    super.initState();
    _tenController = TextEditingController();
    _soLanController = TextEditingController();
    _soVienController = TextEditingController();
    _thoiGianController = TextEditingController();
    _ngayBatDauController = TextEditingController();
    _ngayKetThucController = TextEditingController();
  }

  @override
  void dispose() {
    _tenController.dispose();
    _soLanController.dispose();
    _soVienController.dispose();
    _thoiGianController.dispose();
    _ngayBatDauController.dispose();
    _ngayKetThucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch thuốc'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _tenController,
              decoration: InputDecoration(labelText: 'Tên thuốc'),
            ),
            TextField(
              controller: _soLanController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số lần uống trong ngày'),
            ),
            TextField(
              controller: _soVienController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Số viên uống'),
            ),
            TextField(
              controller: _thoiGianController,
              decoration: InputDecoration(labelText: 'Thời gian sử dụng'),
            ),
            TextField(
              controller: _ngayBatDauController,
              readOnly: true,
              onTap: () => _selectStartDate(context),
              decoration: InputDecoration(labelText: 'Ngày bắt đầu'),
            ),
            TextField(
              controller: _ngayKetThucController,
              readOnly: true,
              onTap: () => _selectEndDate(context),
              decoration: InputDecoration(labelText: 'Ngày kết thúc'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submit,
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _ngayBatDauController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _ngayKetThucController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() async {
    String ten = _tenController.text;
    int soLan = int.tryParse(_soLanController.text) ?? 0;
    int soVien = int.tryParse(_soVienController.text) ?? 0;
    String thoiGian = _thoiGianController.text;
    String ngayBatDau = _ngayBatDauController.text;
    String ngayKetThuc = _ngayKetThucController.text;

    final medicationData = {
      'ten': ten,
      'soLanUongTrongNgay': soLan,
      'soVienUong': soVien,
      'thoiGianSuDung': thoiGian,
      'ngayBatDau': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngayBatDau),
      ),
      'ngayKetThuc': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngayKetThuc),
      ),
    };

    try {
      await createMedication(medicationData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã tạo lịch thuốc thành công'),
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
      // Sau khi tạo thành công, bạn có thể thực hiện các tác vụ khác ở đây, ví dụ chuyển người dùng đến màn hình danh sách lịch thuốc
    } catch (e) {
      print('Error creating medication: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi khi tạo lịch thuốc'),
        ),
      );
    }
  }
}

class CreateVaccinationAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch tiêm chủng'),
      ),
      body: Center(
        child: Text('Đây là màn hình tạo lịch tiêm chủng'),
      ),
    );
  }
}

class CreateMealAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch bữa ăn'),
      ),
      body: Center(
        child: Text('Đây là màn hình tạo lịch bữa ăn'),
      ),
    );
  }
}

class CreateMeasurementAppointmentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch đo kích thước'),
      ),
      body: Center(
        child: Text('Đây là màn hình tạo lịch đo kích thước'),
      ),
    );
  }
}

void checkAndUpdateStatus(List<Appointments> appointments) {
  final DateTime today = DateTime.now();
  for (var appointment in appointments) {
    if (appointment.thuoc != null) {
      final Thuoc thuoc = appointment.thuoc!;
      if (today.isAfter(thuoc.ngayKetThuc)) {
        appointment.isCompleted = true;
        updateAppointmentStatus(appointment.id, true);
      }
    }
  }
}
