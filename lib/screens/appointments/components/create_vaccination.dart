import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';
import 'package:petcarepal/screens/appointments/service/appointment_api.dart';

class CreateVaccinationAppointmentScreen extends StatefulWidget {
  @override
  _CreateVaccinationAppointmentScreenState createState() =>
      _CreateVaccinationAppointmentScreenState();
}

class _CreateVaccinationAppointmentScreenState
    extends State<CreateVaccinationAppointmentScreen> {
  late TextEditingController _mucDichController;
  late TextEditingController _phongKhamController;
  late TextEditingController _ngayKhamController;

  @override
  void initState() {
    super.initState();
    _mucDichController = TextEditingController();
    _phongKhamController = TextEditingController();
    _ngayKhamController = TextEditingController();
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
        title: Text('Tạo lịch tiêm chủng'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView(
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
        _ngayKhamController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() async {
    String mucDich = _mucDichController.text;
    String phongKham = _phongKhamController.text;
    String ngayKham = _ngayKhamController.text;

    final vaccinationData = {
      'mucDich': mucDich,
      'phongKham': phongKham,
      'ngayKham': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngayKham),
      ),
    };

    try {
      await createVaccination(vaccinationData);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tạo lịch tiếm chủng thành công'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => InfoAppointment()),
      );
    } catch (e) {
      print('Error creating vaccination: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi khi tạo lịch tiêm chủng'),
        ),
      );
    }
  }
}
