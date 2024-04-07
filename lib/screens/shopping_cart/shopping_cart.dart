import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/QR/momo.dart';
import 'package:petcarepal/screens/QR/qr_screen.dart';
import 'package:petcarepal/screens/shopping_cart/services/shopping_api.dart';

class ShoppingCart extends StatefulWidget {
  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  ShoppingApi _shoppingApi = ShoppingApi();
  late List<dynamic>? cartItems; // Change type to List<dynamic>?

  TextEditingController addressController = TextEditingController();
  String selectedPaymentMethod =
      'Cash'; // Initialize selected payment method to Cash

  bool showError = false;

  @override
  void initState() {
    super.initState();
    cartItems = [];
    // Fetch cart items and initialize the list
    _fetchCartItems();
  }

  Future<void> _fetchCartItems() async {
    // Fetch cart items from the API
    List<dynamic> items = await _shoppingApi.getCart();
    print(items);
    setState(() {
      cartItems = items;
    });
  }

  int _updateQuantity(int index, int newQuantity) {
    setState(() {
      cartItems![index]['soLuong'] = newQuantity;
    });

    return newQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
      ),
      body: cartItems == null
          ? Center(child: CircularProgressIndicator())
          : cartItems!.isEmpty
              ? Center(child: Text('No items in the cart'))
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cartItems!.length + 1,
                        itemBuilder: (context, index) {
                          if (index < cartItems!.length) {
                            final sanPham = cartItems![index]['sanPham'];
                            final price = sanPham['giaTien'];
                            int quantity = cartItems![index]['soLuong'];
                            final itemTotalPrice = price * quantity;
                            final sp_id = cartItems![index]['id'];

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
                                            if (quantity > 1) {
                                              int newQuantity = _updateQuantity(
                                                  index, quantity - 1);
                                              _shoppingApi.updateCart(
                                                  sp_id, newQuantity);
                                            }
                                          },
                                          icon: Icon(Icons.remove),
                                        ),
                                        Text('Quantity: $quantity'),
                                        IconButton(
                                          onPressed: () {
                                            int newQuantity = _updateQuantity(
                                                index, quantity + 1);
                                            _shoppingApi.updateCart(
                                                sp_id, newQuantity);
                                          },
                                          icon: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: Text(
                                  '\đ${price.toStringAsFixed(0)}',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            );
                          } else {
                            double totalPrice = cartItems!.fold(
                                0,
                                (total, item) =>
                                    total +
                                    item['sanPham']['giaTien'] *
                                        item['soLuong']);
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
                                  '\đ${totalPrice.toStringAsFixed(0)}',
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
                              errorText: showError
                                  ? 'Please enter your address'
                                  : null,
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
                            items: ['Cash', 'Momo', 'MBbank', 'PayPal']
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
                            onPressed: () async {
                              if (addressController.text.isEmpty) {
                                setState(() {
                                  showError = true;
                                });
                              } else {
                                setState(() {
                                  showError = false;
                                });
                                String address = addressController.text;
                                String paymentMethod = 'Cash';

                                if (selectedPaymentMethod == 'Momo') {
                                  paymentMethod = 'MOMO';
                                } else if (selectedPaymentMethod == 'MBbank') {
                                  paymentMethod = 'Internet Banking';
                                } else if (selectedPaymentMethod == 'Paypal') {
                                  paymentMethod = 'Paypal';
                                }

                                int order_id = await _shoppingApi.payment(
                                    paymentMethod, address);

                                if (paymentMethod == 'Internet Banking') {
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

                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => QRScreen(
                                                  order_id: order_id,
                                                )));
                                  });
                                } else if (paymentMethod == 'QR') {
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

                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => MomoScreen(
                                                  order_id: order_id,
                                                )));
                                  });
                                } else if (paymentMethod == 'Cash') {
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

                                  Future.delayed(Duration(seconds: 2), () {
                                    // Navigate to another page
                                    Navigator.pushNamed(
                                      context,
                                      AppRoutes.payment_success,
                                    );
                                  });
                                }

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
                ),
    );
  }

  @override
  void dispose() {
    addressController.dispose();
    super.dispose();
  }
}
