import 'package:flutter/material.dart';
import 'package:petcarepal/screens/pet_shop/components/custom_tab_bar.dart';
import 'package:petcarepal/screens/pet_shop/components/search_bar.dart';
import 'package:petcarepal/screens/pet_shop/components/tab_content.dart';

class PetShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4, // Số lượng tab
      child: Scaffold(
        appBar: AppBar(
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
                // Xử lý khi người dùng nhấp vào biểu tượng giỏ hàng
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
      ),
    );
  }
}
