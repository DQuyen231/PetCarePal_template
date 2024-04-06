import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({Key? key}) : super(key: key);

  Future<void> clearSharedPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Profile'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: Image.asset('assets/images/admin.png').image,
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Administrator',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('vodinhquyen112@gmail.com'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1234567890'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Location'),
              subtitle: Text('Ho Chi Minh, VietNam'),
            ),
            Divider(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await clearSharedPreferences();
                Navigator.pushNamed(context, AppRoutes.login);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, // Background color
                onPrimary: Colors.white, // Text color
                padding: EdgeInsets.symmetric(
                    horizontal: 100, vertical: 16), // Button padding
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8)), // Button border radius
                elevation: 3, // Button elevation
              ),
              child: Text('LOG OUT'),
            ),
          ],
        ),
      ),
    );
  }
}
