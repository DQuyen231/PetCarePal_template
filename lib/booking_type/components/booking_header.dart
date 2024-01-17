
import 'package:flutter/material.dart';

class BookingHeader extends StatelessWidget {
  const BookingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(248,247,251,255),
      title: const Text('Chọn loại lịch', style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          // Handle back button press
          Navigator.of(context).pop();
        },
      ),
      elevation: 0, // Set elevation to 0 to remove the bottom line
    );
  }
}