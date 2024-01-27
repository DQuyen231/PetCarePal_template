import 'package:flutter/material.dart';
import 'package:petcarepal/screens/edit_user_profile/components/select_date.dart';
import 'package:petcarepal/screens/pet_profile/components/custom_input.dart';
import 'package:petcarepal/screens/pet_profile/components/gender_select.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({Key? key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hồ sơ thú cưng',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        iconTheme: IconThemeData(color: Color(0xFF4552CB)),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage(
                    'assets/images/default_image.jpg'), // Replace with your image path
              ),
              SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin thú cưng',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  CustomInput(
                    labelText: 'Tên',
                  ),
                  SizedBox(height: 8.0),
                  CustomInput(
                    labelText: 'Loài',
                    showArrow: true,
                  ),
                  SizedBox(height: 8.0),
                  CustomInput(
                    labelText: 'Giống loài',
                    showArrow: true,
                  ),
                  SizedBox(height: 8.0),
                  CustomInput(
                    labelText: 'Kích thước',
                    showArrow: true,
                  ),
                  SizedBox(height: 20.0),
                  GenderSelect(
                    onGenderChanged: (gender) {
                      setState(() {
                        _selectedGender = gender;
                        print('Selected gender: $_selectedGender');
                      });
                    },
                    label: 'Giới tính',
                  ),
                  SizedBox(height: 8.0),
                  SelectDate(
                    labelText: 'Ngày sinh',
                    icon: Icons.calendar_today,
                  ),
                ],
              ),
              SizedBox(height: 40.0),
              Container(
                width: 335,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    // Xử lý khi nút được nhấp vào
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF4552CB),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    'Lưu',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // In đậm chữ
                      fontSize: 16, // Phóng to kích thước chữ
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
