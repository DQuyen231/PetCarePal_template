import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';

class CreateSizeAppointmentScreen extends StatefulWidget {
  @override
  _CreateSizeAppointmentScreenState createState() =>
      _CreateSizeAppointmentScreenState();
}

class _CreateSizeAppointmentScreenState
    extends State<CreateSizeAppointmentScreen> {
  late TextEditingController _chieuCaoController;
  late TextEditingController _canNangController;
  late TextEditingController _thoiGianDoController;

  @override
  void initState() {
    super.initState();
    _chieuCaoController = TextEditingController();
    _canNangController = TextEditingController();
    _thoiGianDoController = TextEditingController();
  }

  @override
  void dispose() {
    _chieuCaoController.dispose();
    _canNangController.dispose();
    _thoiGianDoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch đo chiều cao'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _chieuCaoController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Chiều cao'),
            ),
            TextField(
              controller: _canNangController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Cân nặng'),
            ),
            TextField(
              controller: _thoiGianDoController,
              readOnly: true,
              onTap: () => _selectDate(context),
              decoration: InputDecoration(labelText: 'Thời gian đo'),
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null)
      setState(() {
        _thoiGianDoController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() async {
    int chieuCao = int.tryParse(_chieuCaoController.text) ?? 0;
    int canNang = int.tryParse(_canNangController.text) ?? 0;
    String thoiGianDo = _thoiGianDoController.text;

    final sizeData = {
      'chieuCao': chieuCao,
      'canNang': canNang,
      'thoiGianDo': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(thoiGianDo),
      ),
    };

    try {
      await createSize(sizeData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tạo lịch đo chiều cao thành công'),
        ),
      );
      Navigator.popUntil(context, (route) => route.isFirst);
    } catch (e) {
      print('Error creating size: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi khi tạo lịch đo kích thước'),
        ),
      );
    }
  }
}
