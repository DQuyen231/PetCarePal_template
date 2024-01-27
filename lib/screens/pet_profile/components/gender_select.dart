import 'package:flutter/material.dart';

class GenderSelect extends StatefulWidget {
  final ValueChanged<String> onGenderChanged;
  final String label;

  const GenderSelect({
    Key? key,
    required this.onGenderChanged,
    required this.label,
  }) : super(key: key);

  @override
  _GenderSelectionState createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelect> {
  String _selectedGender = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            color: Color(0xFFBBC3CE),
            fontSize: 16,
            fontWeight: FontWeight.w600,
            height: 0,
            letterSpacing: 0.13,
          ),
        ),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 'Đực';
                    widget.onGenderChanged(_selectedGender);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedGender == 'Đực'
                      ? Color(0xFF4552CB) // Màu nền khi được chọn
                      : Colors.white, // Màu nền khi chưa được chọn
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/male.png',
                      color: _selectedGender == 'Đực'
                          ? Colors.white // Màu chữ khi được chọn
                          : Colors.blue,
                    ),
                    Text(
                      'Đực',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _selectedGender == 'Đực'
                            ? Colors.white // Màu chữ khi được chọn
                            : Colors.black, // Màu chữ khi chưa được chọn
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: 20.0),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _selectedGender = 'Cái';
                    widget.onGenderChanged(_selectedGender);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: _selectedGender == 'Cái'
                      ? Color(0xFF4552CB) // Màu nền khi được chọn
                      : Colors.white, // Màu nền khi chưa được chọn
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/icons/female.png',
                      color:
                          _selectedGender == 'Cái' ? Colors.white : Colors.pink,
                    ),
                    Text(
                      'Cái',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: _selectedGender == 'Cái'
                            ? Colors.white // Màu chữ khi được chọn
                            : Colors.black, // Màu chữ khi chưa được chọn
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
