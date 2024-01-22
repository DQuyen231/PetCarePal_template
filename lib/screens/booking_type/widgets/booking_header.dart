import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: const Text('Chọn loại lịch',
          style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back button press
          Navigator.pushNamed(context, AppRoutes.home);
        },
      ),
      elevation: 0, // Set elevation to 0 to remove the bottom line
    );
  }
}
