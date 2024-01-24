import 'package:flutter/material.dart';

class GenderOption extends StatefulWidget {
  final ValueChanged<String> onGenderChanged;
  final String label;

  const GenderOption({
    Key? key,
    required this.onGenderChanged,
    required this.label,
  }) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderOption> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 20.0), // Thêm padding sang bên phải
          child: Text(
            widget.label,
            style: TextStyle(
              color: Color(0xFFBBC3CE),
              fontSize: 13,
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: 0.13,
            ),
          ),
        ),
        SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 20.0), // Thêm padding trái phải cho Row
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedGender = 'Nam';
                      widget.onGenderChanged(_selectedGender);
                    });
                  },
                  child: Text(
                    'Nam',
                    style: TextStyle(
                      color: Color(0xFF070821),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.13,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedGender = 'Nữ';
                      widget.onGenderChanged(_selectedGender);
                    });
                  },
                  child: Text(
                    'Nữ',
                    style: TextStyle(
                      color: Color(0xFF070821),
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      height: 0,
                      letterSpacing: 0.13,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
