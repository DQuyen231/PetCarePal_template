import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';

class EditVaccinationScreen extends StatefulWidget {
  final TiemChung tiemChung;

  const EditVaccinationScreen({Key? key, required this.tiemChung})
      : super(key: key);

  @override
  _EditVaccinationScreenState createState() => _EditVaccinationScreenState();
}

class _EditVaccinationScreenState extends State<EditVaccinationScreen> {
  late TextEditingController _mucDichController;
  late TextEditingController _phongKhamController;
  late TextEditingController _ngayKhamController;

  @override
  void initState() {
    super.initState();
    _mucDichController = TextEditingController(text: widget.tiemChung.mucDich);
    _phongKhamController =
        TextEditingController(text: widget.tiemChung.phongKham);
    _ngayKhamController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.tiemChung.ngayKham));
  }

  @override
  void dispose() {
    _mucDichController.dispose();
    _phongKhamController.dispose();
    _ngayKhamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa lịch tiêm chủng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _mucDichController,
              decoration: InputDecoration(labelText: 'Mục đích'),
            ),
            TextField(
              controller: _phongKhamController,
              decoration: InputDecoration(labelText: 'Phòng khám'),
            ),
            TextField(
              controller: _ngayKhamController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(labelText: 'Ngày khám'),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.tiemChung.ngayKham,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.tiemChung.ngayKham)
      setState(() {
        _ngayKhamController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() {
    final updatedVaccination = {
      'mucDich': _mucDichController.text,
      'phongKham': _phongKhamController.text,
      'ngayKham': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_ngayKhamController.text),
      ),
    };
    Navigator.pop(context, updatedVaccination);
  }
}
