// appointment_info_widget.dart
import 'package:flutter/material.dart';

class AppointmentInfoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phòng khám thú y',
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.36,
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Text(
          'Khám da liễu',
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 12,
            fontWeight: FontWeight.w400,
            height: 0.12,
            letterSpacing: 0.24,
          ),
        ),
        SizedBox(
          height: 26,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0EFF8),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/map_pin.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              '1.5 km',
              style: TextStyle(
                color: Color(0xFF070821),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 0.13,
                letterSpacing: 0.40,
              ),
            ),
            SizedBox(
              width: 25,
            ),
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF0EFF8),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icons/wallet.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ),
            SizedBox(width: 4),
            Text(
              '\$20',
              style: TextStyle(
                color: Color(0xFF070821),
                fontSize: 11,
                fontWeight: FontWeight.w500,
                height: 0.13,
                letterSpacing: 0.40,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
