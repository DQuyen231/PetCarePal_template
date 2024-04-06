// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:petcarepal/screens/personal_pet/my_pet.dart'; // Import gói http
// import 'package:petcarepal/screens/pet_profile/service/pet_api.dart';

// class PetProfile extends StatefulWidget {
//   @override
//   _PetProfileState createState() => _PetProfileState();
// }

// class _PetProfileState extends State<PetProfile> {
//   late TextEditingController _tenController;
//   late TextEditingController _loaiController;
//   late TextEditingController _gioiTinhController;
//   late TextEditingController _ngaySinhController;
//   late TextEditingController _tinhTrangController;

//   @override
//   void initState() {
//     super.initState();
//     _tenController = TextEditingController();
//     _tinhTrangController = TextEditingController();
//     _gioiTinhController = TextEditingController();
//     _loaiController = TextEditingController();
//     _ngaySinhController = TextEditingController();
//   }

//   @override
//   void dispose() {
//     _tenController.dispose();
//     _tinhTrangController.dispose();
//     _gioiTinhController.dispose();
//     _loaiController.dispose();
//     _ngaySinhController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Tạo thú cưng',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         iconTheme: IconThemeData(color: Color(0xFF4552CB)),
//       ),
//       body: Container(
//         padding: EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             TextField(
//               controller: _tenController,
//               decoration: InputDecoration(
//                 labelText: 'Tên',
//               ),
//             ),
//             TextField(
//                 controller: _loaiController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Loại',
//                 )),
//             TextField(
//                 controller: _gioiTinhController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Giới tính',
//                 )),
//             TextField(
//               controller: _ngaySinhController,
//               readOnly: true,
//               onTap: () => _selectBirthDate(context),
//               decoration: InputDecoration(
//                 labelText: 'Ngày sinh',
//               ),
//             ),
//             TextField(
//                 controller: _tinhTrangController,
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   labelText: 'Tinh trang',
//                 )),
//             SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _submit, // Gọi hàm _submitForm khi nhấn nút "Lưu"
//               child: Text('Lưu'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _selectBirthDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2015, 8),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null)
//       setState(() {
//         _ngaySinhController.text = DateFormat('dd/MM/yyyy').format(picked);
//       });
//   }

//   void _submit() async {
//     String ten = _tenController.text;
//     int loai = int.parse(_loaiController.text);
//     int gioiTinh = int.parse(_gioiTinhController.text);
//     String ngaySinh = _ngaySinhController.text;
//     int tinhTrang = int.parse(_tinhTrangController.text);

//     final petData = {
//       'ten': ten,
//       'loai': loai,
//       'gioiTinh': gioiTinh,
//       'ngayBatDau': DateFormat('yyyy-MM-dd').format(
//         DateFormat('dd/MM/yyyy').parse(ngaySinh),
//       ),
//       'tinhTrang': tinhTrang
//     };

//     try {
//       await createPet(petData, await getUserIDFromLocalStorage());
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Đã tạo thú cưng thành công'),
//         ),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => MyPet()),
//       );

//       // Sau khi tạo thành công, bạn có thể thực hiện các tác vụ khác ở đây, ví dụ chuyển người dùng đến màn hình danh sách lịch thuốc
//     } catch (e) {
//       print('Error creating pet: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Đã xảy ra lỗi khi tạo thú cưng'),
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart'; // Import gói http
import 'package:petcarepal/screens/pet_profile/service/pet_api.dart';

class PetProfile extends StatefulWidget {
  @override
  _PetProfileState createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  late TextEditingController _tenController;
  late TextEditingController _loaiController;
  late TextEditingController _gioiTinhController;
  late TextEditingController _ngaySinhController;
  late TextEditingController _tinhTrangController;
  int? _selectedLoai; // Loại là chọn
  int? _selectedGioiTinh; // Giới tính được chọn
  int? _selectedTinhTrang; // Tình trạng là chọn

  @override
  void initState() {
    super.initState();
    _tenController = TextEditingController();
    _tinhTrangController = TextEditingController();
    _gioiTinhController = TextEditingController();
    _loaiController = TextEditingController();
    _ngaySinhController = TextEditingController();
  }

  @override
  void dispose() {
    _tenController.dispose();
    _tinhTrangController.dispose();
    _gioiTinhController.dispose();
    _loaiController.dispose();
    _ngaySinhController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tạo thú cưng',
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
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _tenController,
              decoration: InputDecoration(
                labelText: 'Tên',
              ),
            ),
            DropdownButtonFormField<int>(
              value: _selectedLoai,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedLoai = newValue;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('Chó'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Mèo'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Loại',
              ),
            ),
            DropdownButtonFormField<int>(
              value: _selectedGioiTinh,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedGioiTinh = newValue;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('Đực'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Cái'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Giới tính',
              ),
            ),
            TextField(
              controller: _ngaySinhController,
              readOnly: true,
              onTap: () => _selectBirthDate(context),
              decoration: InputDecoration(
                labelText: 'Ngày sinh',
              ),
            ),
            DropdownButtonFormField<int>(
              value: _selectedTinhTrang,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedTinhTrang = newValue;
                });
              },
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  child: Text('Chưa thiến'),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  child: Text('Đã thiến'),
                ),
              ],
              decoration: InputDecoration(
                labelText: 'Tình trạng',
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submit, // Gọi hàm _submitForm khi nhấn nút "Lưu"
              child: Text('Lưu'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1990),
      lastDate: DateTime.now(),
    );
    if (picked != null)
      setState(() {
        _ngaySinhController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
  }

  void _submit() async {
    String ten = _tenController.text;
    int loai = _selectedLoai ?? 0;
    int gioiTinh = _selectedGioiTinh ?? 0;
    String ngaySinh = _ngaySinhController.text;
    int tinhTrang = _selectedTinhTrang ?? 0;

    final petData = {
      'ten': ten,
      'loai': loai,
      'gioiTinh': gioiTinh,
      'ngayBatDau': DateFormat('yyyy-MM-dd').format(
        DateFormat('dd/MM/yyyy').parse(ngaySinh),
      ),
      'tinhTrang': tinhTrang,
    };

    try {
      await createPet(petData, await getUserIDFromLocalStorage());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã tạo thú cưng thành công'),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => MyPet()),
      );
      // Sau khi tạo thành công, bạn có thể thực hiện các tác vụ khác ở đây, ví dụ chuyển người dùng đến màn hình danh sách lịch thuốc
    } catch (e) {
      print('Error creating pet: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Đã xảy ra lỗi khi tạo thú cưng'),
        ),
      );
    }
  }
}
