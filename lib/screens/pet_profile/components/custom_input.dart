import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String labelText;
  final bool showArrow;
  final ValueChanged<String>? onChanged;

  const CustomInput({
    Key? key,
    required this.labelText,
    this.showArrow = false,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: Color(0xFFBBC3CE),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 97, 101, 237)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        suffixIcon: showArrow
            ? IconButton(
                icon: Image.asset('assets/icons/arrow.png'),
                onPressed: () {
                  // Xử lý khi IconButton được nhấp vào
                  print('IconButton pressed');
                },
              )
            : null,
      ),
      onChanged: onChanged,
    );
  }
}
