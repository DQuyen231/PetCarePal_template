import 'package:flutter/material.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/dashboard/models/menu_item.dart';
import 'package:petcarepal/screens/dashboard/widgets/sidebar_menu_item.dart';

final List<MenuItem> menuItems = [
  MenuItem('Home', Icons.home_outlined),
  MenuItem('Dashboard', Icons.dashboard_outlined),
  MenuItem('User', Icons.person),
  MenuItem('Contact', Icons.contact_mail),
];

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final bool _isDesktop = _size.width >= screenLg;
    return Container(
      decoration: BoxDecoration(color: primary),
      width: _isDesktop ? sideBarDesktopWidth : sideBarMobileWidth,
      padding:
          EdgeInsets.symmetric(vertical: 24, horizontal: _isDesktop ? 24 : 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: primaryAncient),
            width: 45,
            height: 45,
            child: Center(
              child: Text(
                'C',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:
                menuItems.map((e) => SideBarMenuItem(e, _isDesktop)).toList(),
          ))
        ],
      ),
    );
  }
}
