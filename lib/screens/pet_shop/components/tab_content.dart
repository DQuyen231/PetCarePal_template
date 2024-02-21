// product_list_by_category.dart
import 'package:flutter/material.dart';

import 'package:petcarepal/screens/pet_shop/models/product.model.dart';

import 'package:petcarepal/screens/pet_shop/services/pet_shop_api.dart';
import 'product_card.dart';

// product_list_by_category.dart
class ProductListByCategory extends StatelessWidget {
  final String category;

  ProductListByCategory({required this.category});

  void addToCart(int quantity, int productId) {
    final cart = {"sanPhamId": productId, "soLuong": quantity};
    PetShopApi().createShoppingCart(cart);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder<List<ProductModelTest>>(
                future: PetShopApi().getProducts(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    final List<ProductModelTest> filteredProducts =
                        snapshot.data ?? [];

                    return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: filteredProducts.length,
                      itemBuilder: (context, index) {
                        ProductModelTest product = filteredProducts[index];
                        return ProductCard(
                          product: product,
                          id: product.id,
                          onAddToCart: addToCart,
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
