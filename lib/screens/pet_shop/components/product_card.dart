import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:petcarepal/screens/pet_shop/models/product.model.dart';

class ProductCard extends StatefulWidget {
  final ProductModelTest product;
  final int id;
  final Function(int quantity, int productId) onAddToCart;
  final Function(ProductModelTest product)? onAddToCartWithProduct;

  ProductCard(
      {required this.product,
      required this.id,
      required this.onAddToCart,
      this.onAddToCartWithProduct});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int selectedQuantity = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFE4E3F2),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    widget.product.imageUrl,
                    width: 143,
                    height: 143,
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        '\$${widget.product.price}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 6),
                      Row(
                        children: [
                          // Additional fields based on your data
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.remove,
                    color: Color(0xFF4552CB),
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedQuantity > 0) {
                        selectedQuantity--;
                      }
                    });
                  },
                ),
                Text(selectedQuantity.toString()),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color: Color(0xFF4552CB),
                  ),
                  onPressed: () {
                    setState(() {
                      selectedQuantity++;
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: selectedQuantity > 0
                      ? () {
                          widget.onAddToCart(selectedQuantity, widget.id);

                          // if (widget.onAddToCartWithProduct != null) {
                          //   print(widget.product);
                          //   widget.onAddToCartWithProduct!(widget.product);
                          // }
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 86, 152, 238),
                    onPrimary: Colors.white,
                  ),
                  child: Text('Add to Cart'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
