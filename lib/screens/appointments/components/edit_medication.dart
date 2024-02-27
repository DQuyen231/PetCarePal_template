import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';

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
        title: Text('Chỉnh sửa lịch thuốc'),
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
