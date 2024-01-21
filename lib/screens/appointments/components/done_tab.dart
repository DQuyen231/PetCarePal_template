import 'package:flutter/material.dart';

class DoneTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(228, 227, 243, 1),
      child: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Đặt giữa theo chiều dọc
          children: [
            Image.asset(
              'assets/icons/clock.png', // Đường dẫn của tệp tin ảnh trong assets
              width: 64.0, // Độ rộng của ảnh
              height: 64.0, // Độ cao của ảnh
            ),
            SizedBox(height: 16.0),
            Text(
              'Không có dữ liệu',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFBBC3CE),
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 0.09,
                letterSpacing: 0.16,
              ),
            )
          ],
        ),
      ),
    );
  }
}
