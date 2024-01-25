// product_card.dart
import 'package:flutter/material.dart';
import 'package:petcarepal/screens/pet_shop/product_data.dart';

class ProductCard extends StatefulWidget {
  final ProductModel product;

  ProductCard({required this.product});

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int selectedQuantity = 1;

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
                  child: Image.asset(
                    widget.product.imageUrl,
                    width: 143,
                    height: 143,
                  ),
                ),
                SizedBox(width: 10),
                Column(
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
                        Text(
                          '${widget.product.rating}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                      ],
                    ),
                  ],
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
                    color:
                        Color(0xFF4552CB), // Màu của biểu tượng khi được chọn
                  ),
                  onPressed: () {
                    setState(() {
                      if (selectedQuantity > 1) {
                        selectedQuantity--;
                        widget.product.quantity = selectedQuantity;
                      }
                    });
                  },
                ),
                Text(selectedQuantity.toString()),
                IconButton(
                  icon: Icon(
                    Icons.add,
                    color:
                        Color(0xFF4552CB), // Màu của biểu tượng khi được chọn
                  ),
                  onPressed: () {
                    setState(() {
                      selectedQuantity++;
                      widget.product.quantity = selectedQuantity;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
