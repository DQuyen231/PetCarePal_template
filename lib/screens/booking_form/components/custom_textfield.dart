import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String label;
  final TextEditingController controller;

  const CustomTextField({
    Key? key,
    required this.onChanged,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        setState(() {
          widget.onChanged(value);
        });
      },
      style: TextStyle(fontSize: 16.0, color: Colors.black87),
      decoration: InputDecoration(
        labelText: widget.label,
        labelStyle: TextStyle(
          color: Color(0xFFBBC3CE),
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF070821)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(240, 240, 248, 1)),
        ),
      ),
    );
  }
}
