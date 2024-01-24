import 'package:flutter/material.dart';
import 'package:petcarepal/screens/edit_user_profile/components/gender_option.dart';
import 'package:petcarepal/screens/edit_user_profile/components/input.dart';
import 'package:petcarepal/screens/edit_user_profile/components/introduce_input.dart';
import 'package:petcarepal/screens/edit_user_profile/components/phone_input.dart';

class EditUserProfile extends StatefulWidget {
  @override
  _EditUserProfileState createState() => _EditUserProfileState();
}

class _EditUserProfileState extends State<EditUserProfile> {
  String _selectedGender = '';
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _introductionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin cá nhân',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.36,
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
        // Các thuộc tính khác của AppBar nếu cần
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(5.0),
          child: Column(
            children: [
              SizedBox(height: 10.0),
              CircleAvatar(
                radius: 60.0,
                backgroundImage: AssetImage('assets/images/user_avatar.png'),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: UserInput(
                  controller: _nameController,
                  onChanged: (value) {
                    // Xử lý giá trị từ UserInput
                    print('New value: $value');
                  },
                  label: 'Tên người dùng',
                ),
              ),
              SizedBox(height: 20.0),
              GenderOption(
                onGenderChanged: (gender) {
                  setState(() {
                    _selectedGender = gender;
                    print('Selected gender: $_selectedGender');
                  });
                },
                label: 'Giới tính',
              ),
              SizedBox(height: 20.0),
              PhoneInput(
                controller: _phoneController,
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: UserInput(
                  controller: _emailController,
                  onChanged: (value) {
                    // Xử lý giá trị từ UserInput
                    print('New value: $value');
                  },
                  label: 'Email',
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: IntroductionInput(
                  controller: _introductionController,
                ),
              ),
              SizedBox(height: 20.0),
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  width: double.infinity,
                  height: 46, // Chiều rộng tối đa
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý khi người dùng nhấn nút xác nhận
                      print('Confirm button pressed');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(
                          0xFF4552CB), // Màu nền của nút // Màu chữ của nút
                    ),
                    child: Text(
                      'Xác nhận',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
