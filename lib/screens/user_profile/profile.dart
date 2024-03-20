import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/user_profile/components/profile_header.dart';
import 'package:petcarepal/screens/user_profile/components/profile_option.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Hồ sơ',
          style: TextStyle(
            color: Color(0xFF070821),
            fontSize: 25,
            fontFamily: 'Encode Sans',
            fontWeight: FontWeight.w700,
            height: 0,
            letterSpacing: 0.36,
          ),
        ),
        centerTitle: true,
        // Các thuộc tính khác của AppBar nếu cần
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 297, // Điều chỉnh chiều cao của ProfileHeader
              child: ProfileHeader(),
            ),
            SizedBox(height: 30),
            Container(
              height: 320, // Điều chỉnh chiều cao của ProfileOption
              child: Center(
                child: Column(
                  children: [
                    ProfileOption(
                      iconPath: 'assets/icons/expand.png',
                      text: 'Gói Premium',
                      // routeName: AppRoutes.premium,
                      routeName: AppRoutes.premium,
                    ),
                    ProfileOption(
                      iconPath: 'assets/icons/user_add.png',
                      text: 'Mời bạn bè',
                      routeName: '',
                    ),
                    ProfileOption(
                      iconPath: 'assets/icons/circle_help.png',
                      text: 'Trợ giúp',
                      routeName: '',
                    ),
                    ProfileOption(
                      iconPath: 'assets/icons/setting.png',
                      text: 'Cài đặt',
                      routeName: '',
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            child: Image.asset(
                              'assets/icons/signout.png',
                              width: 24,
                              height: 24,
                            ),
                            decoration: ShapeDecoration(
                              color: Color(0xFFE4E3F2),
                              shape: OvalBorder(),
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            'Đăng xuất',
                            style: TextStyle(
                              color: Color(0xFFFF0000),
                              fontSize: 16,
                              fontFamily: 'Encode Sans',
                              fontWeight: FontWeight.w400,
                              height: 0.09,
                              letterSpacing: 0.16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationItem(
            icon: Icon(Icons.pets),
            label: 'Thú cưng',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.calendar_today),
            label: 'Đặt lịch',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Mua sắm',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.account_box),
            label: 'Hồ sơ',
          ),
          // Add more items as needed
        ],
      ), // Thêm các Container khác nếu cần
    );
  }
}
