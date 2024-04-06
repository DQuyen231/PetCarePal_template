import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';

class CreateMealAppointmentScreen extends StatefulWidget {
  @override
  _CreateMealAppointmentScreenState createState() =>
      _CreateMealAppointmentScreenState();
}

class _CreateMealAppointmentScreenState
    extends State<CreateMealAppointmentScreen> {
  late TextEditingController _nameController;
  late TextEditingController _loaiController;
  late TextEditingController _cachDungController;
  late TextEditingController _ngayBatDauController;
  late TextEditingController _ngayKetThucController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _loaiController = TextEditingController();
    _cachDungController = TextEditingController();
    _ngayBatDauController = TextEditingController();
    _ngayKetThucController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _loaiController.dispose();
    _cachDungController.dispose();
    _ngayBatDauController.dispose();
    _ngayKetThucController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tạo lịch ăn'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Tên bữa ăn'),
            ),
            TextField(
              controller: _loaiController,
              decoration: InputDecoration(labelText: 'Loại'),
            ),
            TextField(
              controller: _cachDungController,
              decoration: InputDecoration(labelText: 'Cách dùng'),
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
    String name = _nameController.text;
    String loai = _loaiController.text;
    String cachDung = _cachDungController.text;
    String ngayBatDau = _ngayBatDauController.text;
    String ngayKetThuc = _ngayKetThucController.text;

    final mealData = {
      'name': name,
      'loai': loai,
      'cachDung': cachDung,
      'ngayBatDau': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngayBatDau),
      ),
      'ngayKetThuc': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngayKetThuc),
      ),
    };

    try {
      await createMeal(mealData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lịch ăn đã được tạo'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InfoAppointment()),
      );
    } catch (e) {
      print('Error creating meal: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi khi tạo lịch ăn'),
        ),
      );
    }
  }
}
