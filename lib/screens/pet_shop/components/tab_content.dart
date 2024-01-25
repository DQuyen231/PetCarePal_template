// product_list_by_category.dart
import 'package:flutter/material.dart';
import 'package:petcarepal/screens/pet_shop/product_data.dart';
import 'product_card.dart';

class ProductListByCategory extends StatelessWidget {
  final String category;

  ProductListByCategory({required this.category});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> filteredProducts;

    // Kiểm tra xem danh mục có phải là "Tất cả" hay không
    if (category == 'Tất cả') {
      filteredProducts = allProducts;
    } else {
      // Nếu không phải là "Tất cả", lọc danh sách sản phẩm theo danh mục
      filteredProducts =
          allProducts.where((product) => product.category == category).toList();
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  ProductModel product = filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
