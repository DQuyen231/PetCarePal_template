import 'package:flutter/material.dart';

class BookingContainer extends StatelessWidget {
  const BookingContainer(
      {super.key,
      required this.title,
      required this.description,
      this.onClick,
      required this.image});

  final Function()? onClick;
  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.5;
    double containerHeight = MediaQuery.of(context).size.width * 0.40;
    return Container(
      width: containerWidth,
      height: containerHeight,
      margin: EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover)),
      child: Container(
        margin: EdgeInsets.only(left: 30, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
