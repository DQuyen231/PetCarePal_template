import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/pet_shop/components/custom_tab_bar.dart';
import 'package:petcarepal/screens/pet_shop/components/search_bar.dart';
import 'package:petcarepal/screens/pet_shop/components/tab_content.dart';
import 'package:petcarepal/screens/pet_shop/services/pet_shop_api.dart';

class PetShop extends StatefulWidget {
  @override
  State<PetShop> createState() => _PetShopState();
}

class _PetShopState extends State<PetShop> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 2;

    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Cửa hàng thú cưng',
            style: TextStyle(
              color: Color(0xFF070821),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.cart);
              },
            ),
          ],
          iconTheme: IconThemeData(color: Color(0xFF4552CB)),
          bottom: PreferredSize(
            preferredSize:
                Size.fromHeight(50.0), // Điều chỉnh chiều cao nếu cần
            child: SearchBarWithFilter(),
          ),
        ),
        body: Column(
          children: [
            CustomTabBar(),
            Expanded(
              child: TabBarView(
                children: [
                  // Nội dung cho Tab 1
                  ProductListByCategory(category: 'Tất cả'),
                  ProductListByCategory(category: 'Thức ăn'),
                  ProductListByCategory(category: 'Vệ sinh'),
                  ProductListByCategory(category: 'Dụng cụ'),
                ],
              ),
            ),
          ],
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
        ),
      ),
    );
  }
}
