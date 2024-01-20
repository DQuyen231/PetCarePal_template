// home_screen.dart

import 'package:flutter/material.dart';
import 'package:petcarepal/screens/home/components/welcome.dart';
import 'package:petcarepal/screens/home/components/button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(color: Color(0xFF4552CB)),
      child: Stack(
        children: [
          HeaderWidget(),
          Positioned(
            right: 50.88,
            top: 310,
            child: ActionButtonWidget(
              label: 'Đặt lịch',
              iconAssetPath: AssetImage('assets/icons/booking.png'),
            ),
          ),
          Positioned(
            right: 50.88,
            top: 482.98,
            child: ActionButtonWidget(
              label: 'Trợ giúp',
              iconAssetPath: AssetImage('assets/icons/help.png'),
            ),
          ),
          Positioned(
            left: 50.88,
            top: 310,
            child: ActionButtonWidget(
              label: 'Thú cưng của bạn',
              iconAssetPath: AssetImage('assets/icons/yourpet.png'),
            ),
          ),
          Positioned(
            left: 50.88,
            top: 482.98,
            child: ActionButtonWidget(
              label: 'Thêm thú cưng',
              iconAssetPath: AssetImage('assets/icons/add.png'),
            ),
          ),
        ],
      ),
    );
  }
}
