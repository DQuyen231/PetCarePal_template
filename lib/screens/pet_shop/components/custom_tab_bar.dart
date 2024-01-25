// custom_tab_bar.dart
import 'package:flutter/material.dart';

class CustomTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(text: 'Tất cả'),
        Tab(text: 'Thức ăn'),
        Tab(text: 'Vệ sinh'),
        Tab(text: 'Dụng cụ'),
      ],
      indicatorColor: Color(0xFF4552CB), // Màu của thanh tab indicator
    );
  }
}
