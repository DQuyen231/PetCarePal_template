import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromRGBO(240, 243, 248, 1.0),
      title: const Text('Thú cưng của tôi',
          style: TextStyle(fontWeight: FontWeight.bold)),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.home);
        },
      ),
      elevation: 0, // Set elevation to 0 to remove the bottom line
    );
  }
}
