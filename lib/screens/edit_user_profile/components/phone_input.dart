import 'package:flutter/material.dart';

class PhoneInput extends StatefulWidget {
  final TextEditingController controller;

  const PhoneInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      width: 385,
      height: 80,
      decoration: BoxDecoration(
        color: Color.fromRGBO(249, 250, 251, 1),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Số điện thoại',
            style: TextStyle(
              color: Color(0xFF4552CB),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.13,
            ),
          ),
          Row(
            children: [
              // Dropdown để chọn đầu số quốc gia
              DropdownButton<String>(
                value: '+84', // Mặc định đầu số quốc gia
                onChanged: (String? newValue) {
                  setState(() {
                    // Cập nhật giá trị đầu số quốc gia khi thay đổi
                  });
                },
                items: <String>['+84', '+1', '+44', '+81']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: Color(0xFF4552CB),
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(width: 10.0),
              // TextFormField cho nhập số điện thoại
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  decoration: InputDecoration(
                    hintText: 'Nhập số điện thoại',
                    border: InputBorder.none,
                  ),
                ),
              ),
              // IconButton để xóa nội dung của TextFormField
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  widget.controller.clear();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
