import 'package:flutter/material.dart';

class IntroductionInput extends StatelessWidget {
  final TextEditingController controller;

  const IntroductionInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0, bottom: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Giới thiệu',
                style: TextStyle(
                  color: Color(0xFFBBC3CE),
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.13,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(249, 250, 251, 1),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: TextFormField(
            controller: controller,
            maxLines: 5, // Đặt số dòng tối đa
            decoration: InputDecoration(
              hintText: 'Nhập giới thiệu của bạn',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
