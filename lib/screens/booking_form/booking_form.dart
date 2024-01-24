import 'package:flutter/material.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({Key? key}) : super(key: key);

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromARGB(255, 226, 225, 225),
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: AppBar(
            title: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'Da Liễu',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 0,
                ),
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Thứ ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: '5 ',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'ngày ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: '11 ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue), // Change color as needed
                      ),
                      TextSpan(
                        text: 'tháng ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: '9 ',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                      TextSpan(
                        text: 'năm ',
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      TextSpan(
                        text: '2022 ',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      ),
                    ],
                  ),
                )
              ],
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0.0,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 50, 157, 245),
              ),
              onPressed: () {
                // Handle back button press
                print('pressed');
              },
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20, left: 20),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0F8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Địa điểm',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 152, 153, 155)),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit),
                    onPressed: () {
                      // Handle edit button press
                      print('Edit button pressed');
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4552CB),
                  ),
                  onPressed: () {
                    // Handle button press
                    print('Button pressed');
                  },
                  child: Text(
                    'Tạo lịch trình',
                    style: TextStyle(color: Colors.white),
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
