

import 'package:flutter/material.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer({super.key, required this.title, required this.description});

  final title;
  final description;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;
    double containerHeight = MediaQuery.of(context).size.width * 0.3;
    return Container(
      width: containerWidth,
      height: containerHeight ,
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 2
        ),
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage('assets/images/default_image.jpg'),
          fit: BoxFit.cover
        )
      ),
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tiêm chủng', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
            Text('Quản lí thời gian,\nloại vaccin cho thú cưng',style: TextStyle(color:   Colors.white, fontSize: 20),),
          ],
        ),
      ),
    );
  }
}