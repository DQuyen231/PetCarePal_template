import 'package:flutter/material.dart';
import 'profile_card.dart';

class ProfileHeader extends StatelessWidget {
  final bool isVip;

  const ProfileHeader({Key? key, required this.isVip}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 297,
      decoration: ShapeDecoration(
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
                        iconPath: 'assets/icons/pet_icon.png',
                      ),
                      ProfileCard(
                        title: 'Yêu thích',
                        value: '1',
                        iconPath: 'assets/icons/heart.png',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (isVip)
            Positioned(
              top: 5, // Đặt vị trí từ đỉnh của container
              right: 135, // Đặt vị trí từ phía bên phải của container
              child: isVip
                  ? Container(
                      padding: EdgeInsets.all(
                          4), // Thêm khoảng cách giữa icon và avatar
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF4552CB),
                      ),
                      child: Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24,
                      ),
                    )
                  : SizedBox(), // Nếu không phải VIP thì không hiển thị gì
            ),
        ],
      ),
    );
  }
}
