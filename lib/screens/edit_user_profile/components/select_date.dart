import 'package:flutter/material.dart';

class SelectDate extends StatefulWidget {
  final String labelText;
  final IconData icon;
  final ValueChanged<String>? onChanged;

  const SelectDate({
    Key? key,
    required this.labelText,
    required this.icon,
    this.onChanged,
  }) : super(key: key);

  @override
  _SelectDateState createState() => _SelectDateState();
}

class _SelectDateState extends State<SelectDate> {
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });

      String formattedDate =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      widget.onChanged?.call(formattedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: Color(0xFFBBC3CE),
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        suffixIcon: IconButton(
          icon: Icon(widget.icon),
          onPressed: () {
            _selectDate(context);
          },
        ),
      ),
      readOnly: true, // Make the text field read-only
      onTap: () {
        _selectDate(context);
      },
      controller: TextEditingController(
        text: _selectedDate != null
            ? '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}'
            : null,
      ),
    );
  }
}
