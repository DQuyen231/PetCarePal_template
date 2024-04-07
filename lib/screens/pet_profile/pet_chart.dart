import 'package:flutter/material.dart';

class PetChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Biểu đồ thú cưng',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        iconTheme: IconThemeData(color: Color(0xFF4552CB)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/avatar.png'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Tommy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Text(
                      'Golden Retriever',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF4552CB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Độ năng động',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF4552CB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ăn',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF4552CB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Uống',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF4552CB),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Ngủ',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 30,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 20,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3),
                        width: 10,
                        height: 40,
                        decoration: BoxDecoration(color: Colors.red),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
