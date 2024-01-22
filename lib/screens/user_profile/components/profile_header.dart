// profile_header.dart
import 'package:flutter/material.dart';
import 'profile_card.dart';

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 297,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(34),
              bottomRight: Radius.circular(34),
            ),
          ),
          shadows: [
            BoxShadow(
              color: Color(0x142C358A),
              blurRadius: 28,
              offset: Offset(4, 6),
              spreadRadius: 0,
            )
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              top: 10,
              left: 0,
              right: 0,
              child: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 70.0,
                      backgroundImage:
                          AssetImage('assets/images/user_avatar.png'),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'James',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF070821),
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.48,
                      ),
                    ),
                    SizedBox(height: 16.0), // Khoảng cách giữa tên và card
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ProfileCard(
                          title: 'Số thú cưng',
                          value: '1',
                          iconPath:
                              'assets/icons/pet_icon.png', // Thay thế bằng đường dẫn biểu tượng của card này
                        ),
                        ProfileCard(
                          title: 'Yêu thích',
                          value: '1',
                          iconPath:
                              'assets/icons/heart.png', // Thay thế bằng đường dẫn biểu tượng của card này
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
