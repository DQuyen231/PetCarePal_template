import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
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
          'Tạo lịch trình',
          style: TextStyle(
            fontWeight: FontWeight.bold, // In đậm chữ
            fontSize: 16, // Phóng to kích thước chữ
          ),
        ),
      ),
    );
  }
}
