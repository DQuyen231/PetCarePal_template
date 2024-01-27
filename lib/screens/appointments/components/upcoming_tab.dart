import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';

class UpcomingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 227, 243, 1),
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            InfoAppointment(),
            SizedBox(height: 250),
            Container(
              width: 335,
              height: 46,
              child: ElevatedButton(
                onPressed: () {
                  // Xử lý khi nút được nhấp vào
                  Navigator.pushNamed(context, AppRoutes.booking_date);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF4552CB),
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  'Thêm lịch trình',
                  style: TextStyle(
                    fontWeight: FontWeight.bold, // In đậm chữ
                    fontSize: 16, // Phóng to kích thước chữ
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
