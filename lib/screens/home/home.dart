import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/home/components/welcome.dart';
import 'package:petcarepal/screens/home/components/button.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375,
      height: 812,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(color: Color(0xFF4552CB)),
      child: Stack(
        children: [
          HeaderWidget(),
          Positioned(
            right: 50.88,
            top: 310,
            child: ActionButtonWidget(
              label: 'Đặt lịch',
              iconAssetPath: const AssetImage('assets/icons/booking.png'),
              onClick: () {
                Navigator.pushNamed(context, AppRoutes.booking);
              },
            ),
          ),
          Positioned(
            right: 50.88,
            top: 482.98,
            child: ActionButtonWidget(
              label: 'Trợ giúp',
              iconAssetPath: const AssetImage('assets/icons/help.png'),
              onClick: () {
                print('Nothing here yet');
              },
            ),
          ),
          Positioned(
            left: 50.88,
            top: 310,
            child: ActionButtonWidget(
              label: 'Thú cưng của bạn',
              iconAssetPath: const AssetImage('assets/icons/yourpet.png'),
              onClick: () {
                Navigator.pushNamed(context, AppRoutes.pet);
              },
            ),
          ),
          Positioned(
            left: 50.88,
            top: 482.98,
            child: ActionButtonWidget(
              label: 'Tài khoản',
              iconAssetPath: const AssetImage('assets/icons/add.png'),
              onClick: () {
                Navigator.pushNamed(context, AppRoutes.account);
              },
            ),
          ),
        ],
      ),
    );
  }
}
