import 'package:flutter/material.dart';

class PetProfile extends StatefulWidget {
  const PetProfile({Key? key});

  @override
  State<PetProfile> createState() => _PetProfileState();
}

class _PetProfileState extends State<PetProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HỒ SƠ THÚ CƯNG', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Color.fromARGB(255, 50, 157, 245),),
          onPressed: () {
            // Handle back button press
            print('pressed');
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/default_image.jpg'), // Replace with your image path
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(labelText: 'Tên'),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(labelText: 'Loài'),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(labelText: 'Giống loài'),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(labelText: 'Kích thước'),
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(labelText: 'Giới tính '),
              
            ),
            SizedBox(height: 8.0),
            TextField(
              decoration: InputDecoration(labelText: 'Ngày sinh'),
              
            ),
          ],
        ),
      ),
    );
  }
}



