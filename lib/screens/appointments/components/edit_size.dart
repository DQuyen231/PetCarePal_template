import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';

class EditSizeScreen extends StatefulWidget {
  final DoKichThuoc doKichThuoc;

  const EditSizeScreen({Key? key, required this.doKichThuoc}) : super(key: key);

  @override
  _EditSizeScreenState createState() => _EditSizeScreenState();
}

class _EditSizeScreenState extends State<EditSizeScreen> {
  late TextEditingController _chieuCaoController;
  late TextEditingController _canNangController;
  late TextEditingController _thoiGianDoController;

  @override
  void initState() {
    super.initState();
    _chieuCaoController =
        TextEditingController(text: widget.doKichThuoc.chieuCao.toString());
    _canNangController =
        TextEditingController(text: widget.doKichThuoc.canNang.toString());
    _thoiGianDoController = TextEditingController(
        text: DateFormat('dd/MM/yyyy').format(widget.doKichThuoc.thoiGianDo));
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
        title: Text('Chỉnh sửa lịch đo kích thước'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
      initialDate: widget.doKichThuoc.thoiGianDo,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != widget.doKichThuoc.thoiGianDo)
      setState(() {
        _thoiGianDoController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() {
    final updatedSize = {
      'chieuCao': int.parse(_chieuCaoController.text),
      'canNang': int.parse(_canNangController.text),
      'thoiGianDo': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(_thoiGianDoController.text),
      ),
    };
    Navigator.pop(context, updatedSize);
  }
}
