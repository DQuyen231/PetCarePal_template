import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final String title;
  final String value;
  final String iconPath; // Thêm thuộc tính iconPath

  const ProfileCard({
    Key? key,
    required this.title,
    required this.value,
    required this.iconPath, // Bổ sung iconPath vào constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 63,
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Color(0xFF4552CB),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath, // Sử dụng đường dẫn biểu tượng được truyền từ bên ngoài
                    width: 20,
                    height: 20,
                    color: Color(0xFF4552CB),
                  ),
                  SizedBox(width: 4.0),
                  Text(
                    value,
                    style: TextStyle(
                      color: Color(0xFF4552CB),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                      letterSpacing: 0.16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
