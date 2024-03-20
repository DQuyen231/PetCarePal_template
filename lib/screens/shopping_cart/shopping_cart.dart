// import 'package:flutter/material.dart';
// import 'package:petcarepal/config/app_routes.dart';
// import 'package:petcarepal/screens/shopping_cart/services/shopping_api.dart';

// class ShoppingCart extends StatefulWidget {
//   @override
//   State<ShoppingCart> createState() => _ShoppingCartState();
// }

// class _ShoppingCartState extends State<ShoppingCart> {
//   ShoppingApi _shoppingApi = ShoppingApi();
//   late Future<List<dynamic>> cartItemsFuture;

//   TextEditingController addressController = TextEditingController();
//   String selectedPaymentMethod =
//       'Cash'; // Initialize selected payment method to Cash

//   bool showError = false;

//   @override
//   void initState() {
//     super.initState();
//     // Initialize the future to load cart items
//     cartItemsFuture = _shoppingApi.getCart();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: FutureBuilder<List<dynamic>>(
//         future: cartItemsFuture,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else {
//             List<dynamic>? cartItems = snapshot.data;
//             if (cartItems == null || cartItems.isEmpty) {
//               return Center(child: Text('No items in the cart'));
//             } else {
//               double totalPrice = 0;
//               return Column(
//                 children: [
//                   Expanded(
//                     child: ListView.builder(
//                       itemCount: cartItems.length + 1,
//                       itemBuilder: (context, index) {
//                         if (index < cartItems.length) {
//                           final sanPham = cartItems[index]['sanPham'];
//                           final price = sanPham['giaTien'];
//                           final quantity = cartItems[index]['soLuong'];
//                           final itemTotalPrice = price * quantity;
//                           totalPrice += itemTotalPrice;
//                           return Card(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             elevation: 2,
//                             child: ListTile(
//                               contentPadding: EdgeInsets.all(12),
//                               title: Text(sanPham['ten']),
//                               leading: ClipRRect(
//                                 borderRadius: BorderRadius.circular(8.0),
//                                 child: Image.network(
//                                   sanPham['hinhAnhUrl'],
//                                   width: 50,
//                                   height: 50,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                               subtitle: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     sanPham['thuongHieu'],
//                                     style: TextStyle(color: Colors.grey),
//                                   ),
//                                   SizedBox(height: 4),
//                                   Text('Quantity: $quantity'),
//                                 ],
//                               ),
//                               trailing: Text(
//                                 '\$${price.toStringAsFixed(2)}',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           );
//                         } else {
//                           return Card(
//                             margin: EdgeInsets.symmetric(
//                                 horizontal: 16, vertical: 8),
//                             elevation: 2,
//                             child: ListTile(
//                               contentPadding: EdgeInsets.all(12),
//                               title: Text(
//                                 'Total:',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                               trailing: Text(
//                                 '\$${totalPrice.toStringAsFixed(2)}',
//                                 style: TextStyle(fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(16.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         TextField(
//                           controller: addressController,
//                           decoration: InputDecoration(
//                             labelText: 'Address',
//                             border: OutlineInputBorder(),
//                             errorText:
//                                 showError ? 'Please enter your address' : null,
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         DropdownButtonFormField<String>(
//                           value: selectedPaymentMethod,
//                           onChanged: (value) {
//                             setState(() {
//                               selectedPaymentMethod = value!;
//                             });
//                           },
//                           items: ['Cash', 'Credit Card', 'PayPal']
//                               .map<DropdownMenuItem<String>>((String value) {
//                             return DropdownMenuItem<String>(
//                               value: value,
//                               child: Text(value),
//                             );
//                           }).toList(),
//                           decoration: InputDecoration(
//                             labelText: 'Payment Method',
//                             border: OutlineInputBorder(),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () {
//                             if (addressController.text.isEmpty) {
//                               setState(() {
//                                 showError = true;
//                               });
//                             } else {
//                               setState(() {
//                                 showError = false;
//                               });
//                               String address = addressController.text;
//                               String paymentMethod = selectedPaymentMethod;
//                               _shoppingApi.payment(paymentMethod, address);

//                               // Show loading indicator
//                               showDialog(
//                                 context: context,
//                                 barrierDismissible:
//                                     false, // Prevent dismissing the dialog
//                                 builder: (context) {
//                                   return Center(
//                                     child: CircularProgressIndicator(),
//                                   );
//                                 },
//                               );

//                               // Simulate a delay of 2 seconds
//                               Future.delayed(Duration(seconds: 2), () {
//                                 // Hide loading indicator
//                                 Navigator.pop(context);

//                                 // Navigate to another page
//                                 // Navigator.pushNamed(
//                                 //   context,
//                                 //   AppRoutes.payment_success,
//                                 // );
//                               });

//                               print('Address: $address');
//                               print('Payment Method: $selectedPaymentMethod');
//                             }
//                           },
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                             child: Text(
//                               'Thanh Toán',
//                               style: TextStyle(fontSize: 16),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }
//           }
//         },
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     addressController.dispose();
//     super.dispose();
//   }
// }

import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/shopping_cart/services/shopping_api.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  ShoppingApi _shoppingApi = ShoppingApi();
  late Future<List<dynamic>> cartItemsFuture;

  TextEditingController addressController = TextEditingController();
  String selectedPaymentMethod =
      'Cash'; // Initialize selected payment method to Cash

  bool showError = false;

  @override
  void initState() {
    super.initState();
    // Initialize the future to load cart items
    cartItemsFuture = _shoppingApi.getCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: cartItemsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            List<dynamic>? cartItems = snapshot.data;
            if (cartItems == null || cartItems.isEmpty) {
              return Center(child: Text('No items in the cart'));
            } else {
              double totalPrice = 0;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length + 1,
                      itemBuilder: (context, index) {
                        if (index < cartItems.length) {
                          final sanPham = cartItems[index]['sanPham'];
                          final price = sanPham['giaTien'];
                          int quantity = cartItems[index]['soLuong'];
                          final itemTotalPrice = price * quantity;
                          totalPrice += itemTotalPrice;

                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            elevation: 2,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(12),
                              title: Text(sanPham['ten']),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  sanPham['hinhAnhUrl'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    sanPham['thuongHieu'],
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            if (quantity > 1) {
                                              quantity--;
                                              // _shoppingApi.updateCartItemQuantity(
                                              //   sanPham['id'], // Pass the ID of the product
                                              //   quantity, // Decrease the quantity by 1
                                              // );
                                            }
                                          });
                                        },
                                        icon: Icon(Icons.remove),
                                      ),
                                      Text('Quantity: $quantity'),
                                      IconButton(
                                        onPressed: () {
                                          setState(() {
                                            quantity++;
                                            // _shoppingApi.updateCartItemQuantity(
                                            //   sanPham['id'], // Pass the ID of the product
                                            //   quantity, // Increase the quantity by 1
                                            // );
                                          });
                                        },
                                        icon: Icon(Icons.add),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              trailing: Text(
                                '\$${price.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        } else {
                          return Card(
                            margin: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            elevation: 2,
                            child: ListTile(
                              contentPadding: EdgeInsets.all(12),
                              title: Text(
                                'Total:',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              trailing: Text(
                                '\$${totalPrice.toStringAsFixed(2)}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            labelText: 'Address',
                            border: OutlineInputBorder(),
                            errorText:
                                showError ? 'Please enter your address' : null,
                          ),
                        ),
                        SizedBox(height: 16),
                        DropdownButtonFormField<String>(
                          value: selectedPaymentMethod,
                          onChanged: (value) {
                            setState(() {
                              selectedPaymentMethod = value!;
                            });
                          },
                          items: ['Cash', 'Credit Card', 'PayPal']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          decoration: InputDecoration(
                            labelText: 'Payment Method',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            if (addressController.text.isEmpty) {
                              setState(() {
                                showError = true;
                              });
                            } else {
                              setState(() {
                                showError = false;
                              });
                              String address = addressController.text;
                              String paymentMethod = selectedPaymentMethod;
                              _shoppingApi.payment(paymentMethod, address);

                              // Show loading indicator
                              showDialog(
                                context: context,
                                barrierDismissible:
                                    false, // Prevent dismissing the dialog
                                builder: (context) {
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                },
                              );

                              // Simulate a delay of 2 seconds
                              Future.delayed(Duration(seconds: 2), () {
                                // Hide loading indicator
                                Navigator.pop(context);

                                // Navigate to another page
                                // Navigator.pushNamed(
                                //   context,
                                //   AppRoutes.payment_success,
                                // );
                              });

                              print('Address: $address');
                              print('Payment Method: $selectedPaymentMethod');
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Text(
                              'Thanh Toán',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }
}
