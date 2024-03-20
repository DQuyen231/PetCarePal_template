import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';

class EditMealScreen extends StatefulWidget {
  final BuaAn buaAn;

  const EditMealScreen({Key? key, required this.buaAn}) : super(key: key);

  @override
  _EditMealScreenState createState() => _EditMealScreenState();
}

class _EditMealScreenState extends State<EditMealScreen> {
  late TextEditingController _nameController;
  late TextEditingController _loaiController;
  late TextEditingController _cachDungController;
  late TextEditingController _ngayBatDauController;
  late TextEditingController _ngayKetThucController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.buaAn.name);
    _loaiController = TextEditingController(text: widget.buaAn.loai);
    _cachDungController = TextEditingController(text: widget.buaAn.cachDung);
    _ngayBatDauController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.buaAn.ngayBatDau));
    _ngayKetThucController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.buaAn.ngayKetThuc));
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
        title: Text('Chỉnh sửa lịch bữa ăn'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Tên bữa ăn'),
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
      initialDate: widget.buaAn.ngayBatDau,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.buaAn.ngayBatDau)
      setState(() {
        _ngayBatDauController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  Future<void> _selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: widget.buaAn.ngayKetThuc,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.buaAn.ngayKetThuc)
      setState(() {
        _ngayKetThucController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() {
    final updatedMeal = {
      'name': _nameController.text,
      'loai': _loaiController.text,
      'cachDung': _cachDungController.text,
      'ngayBatDau': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_ngayBatDauController.text),
      ),
      'ngayKetThuc': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_ngayKetThucController.text),
      ),
    };
    Navigator.pop(context, updatedMeal);
  }
}
