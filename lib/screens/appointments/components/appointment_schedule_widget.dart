// appointment_schedule_widget.dart
import 'package:flutter/material.dart';

class AppointmentScheduleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 295,
      height: 112,
      child: Stack(
        children: [
          Positioned(
            top: 15,
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
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
                    SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Phòng khám thú y',
                          style: TextStyle(
                            color: Color(0xFF070821),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'TP. HCM',
                          style: TextStyle(
                            color: Color(0xFF070821),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            height: 0.12,
                            letterSpacing: 0.24,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFF0EFF8),
                      ),
                      child: Center(
                        child: Image.asset(
                          'assets/icons/border_clock.png',
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'thứ 5 ngày 15 tháng 9 — 09:30 am',
                      style: TextStyle(
                        color: Color(0xFF070821),
                        fontSize: 12,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: 0.24,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: ShapeDecoration(
        color: Color.fromRGBO(248, 247, 251, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A2E1E7A),
            blurRadius: 12,
            offset: Offset(5, 3),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
