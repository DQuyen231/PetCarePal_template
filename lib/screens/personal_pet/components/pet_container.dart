import 'package:flutter/material.dart';

class PetContainer extends StatefulWidget {
  const PetContainer({super.key});

  @override
  State<PetContainer> createState() => _PetContainerState();
}

class _PetContainerState extends State<PetContainer> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.9;

    return IntrinsicHeight(
      child: Container(
        margin: EdgeInsets.only(top: 10.0),
        width: containerWidth,

        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(10.0),
        ), // Set your desired background color
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                  50), // Set a large enough value for a circular shape
              child: Container(
                margin: EdgeInsets.only(top: 0),
                child: Image(
                  image: AssetImage('assets/images/avatar.png'),
                  width: 100,
                  height: 100,
                  fit: BoxFit
                      .cover, // Ensure the image covers the circular shape
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Text(
                      'Tommy',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Golden Retriever',
                      style: TextStyle(
                        color: Color.fromARGB(218, 166, 180, 248),
                      ),
                    ),
                  ],
                )),
            Container(
              width: containerWidth,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                  color: Color(0xFF4552CB),
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Hồ sơ bệnh án',
                  style: TextStyle(
                      color: Color.fromARGB(226, 255, 255, 255), fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
