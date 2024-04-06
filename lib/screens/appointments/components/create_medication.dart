import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';

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
              child: Text('Tạo'),
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
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InfoAppointment()),
      );
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
