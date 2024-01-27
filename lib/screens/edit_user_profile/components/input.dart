import 'package:flutter/material.dart';

class UserInput extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String label;

  const UserInput({
    Key? key,
    required this.onChanged,
    required this.label,
    required TextEditingController controller,
  }) : super(key: key);

  @override
  _UserInputState createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  TextEditingController _controller = TextEditingController();
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onChanged: (value) {
        setState(() {
          _isValid = value.isNotEmpty;
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
        suffixIcon: _isValid
            ? Icon(
                Icons.check,
                color: Colors.green,
              )
            : Icon(
                Icons.error,
                color: Colors.red,
              ),
      ),
    );
  }
}
