import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 41,
      top: 146,
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Quản lý thú cưng\ncủa bạn, ',
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 34,
                fontFamily: 'Encode Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            TextSpan(
              text: 'James',
              style: TextStyle(
                color: Color(0xFFFFCF6F),
                fontSize: 34,
                fontFamily: 'Encode Sans',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
