import 'package:flutter/material.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/dashboard/components/news_list.dart';
import 'package:petcarepal/screens/dashboard/layout/sidebar.dart';
import 'package:petcarepal/screens/dashboard/layout/topbar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    final _showDesktop = _size.width >= screenXl;
    return Scaffold(
        body: SafeArea(
      child: Row(
        children: [
          SideBar(),
          Expanded(
            child: Column(
              children: [
                TopBar(_showDesktop),
                Expanded(
                    child: SingleChildScrollView(
                        child: Padding(
                  child: this.child,
                  padding: EdgeInsets.all(componentPadding),
                )))
              ],
            ),
          ),
          Container(
            width: _showDesktop ? newsPageWidth : 0,
            child: NewsList(_showDesktop),
          )
        ],
      ),
    ));
  }
}
