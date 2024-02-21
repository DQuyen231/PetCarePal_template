import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/appointments/components/info_appointment.dart';

class UpcomingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 227, 243, 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 18,
            ),
            InfoAppointment(),
          ],
        ),
      ),
    );
  }
}
