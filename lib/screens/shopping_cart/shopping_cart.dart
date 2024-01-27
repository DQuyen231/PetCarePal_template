import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RealShoppingCart extends StatelessWidget {
  const RealShoppingCart({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ShoppingCart(),
      ),
    );
  }
}

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  _ShoppingCartState createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  bool isChecked1 = false;
  int itemCount1 = 1;
  int pricePerItem1 = 40000;

  bool isChecked2 = false;
  int itemCount2 = 1;
  int pricePerItem2 = 40000;

  final voucherController = TextEditingController();

  void increaseQuantity(int productIndex) {
    setState(() {
      if (productIndex == 1) {
        itemCount1++;
      } else if (productIndex == 2) {
        itemCount2++;
      }
    });
  }

  void decreaseQuantity(int productIndex) {
    setState(() {
      if (productIndex == 1 && itemCount1 > 1) {
        itemCount1--;
      } else if (productIndex == 2 && itemCount2 > 1) {
        itemCount2--;
      }
    });
  }

  String formatPrice(int price) {
    final formatter = NumberFormat("#,###đ", "en_US");
    return formatter.format(price);
  }

  int calculateTotalPrice(int productIndex) {
    if (productIndex == 1 && isChecked1) {
      return itemCount1 * pricePerItem1;
    } else if (productIndex == 2 && isChecked2) {
      return itemCount2 * pricePerItem2;
    } else {
      return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[300]!,
                  spreadRadius: 5,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            leading: IconButton(
              icon: Icon(Icons.keyboard_arrow_left, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ),
        Positioned(
          top: 56,
          left: 0,
          right: 0,
          bottom: 0,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Giỏ Hàng",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21.0,
                  ),
                ),
                SizedBox(height: 12.0),
                SizedBox(
                  height: 40.0,
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked1,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            isChecked1 = value!;
                          });
                        },
                      ),
                      SizedBox(width: 12.0),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://drive.google.com/uc?export=download&id=1wcD4OsTmecuXZxJCcmFRel9vwMGDGg6n",
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Pate hộp King's pet",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${formatPrice(calculateTotalPrice(1))}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        decreaseQuantity(1);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  itemCount1.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        increaseQuantity(1);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: isChecked2,
                        activeColor: Colors.orange,
                        onChanged: (value) {
                          setState(() {
                            isChecked2 = value!;
                          });
                        },
                      ),
                      SizedBox(width: 12.0),
                      Container(
                        width: 80.0,
                        height: 80.0,
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          image: DecorationImage(
                            image: NetworkImage(
                              "https://drive.google.com/uc?export=download&id=1UYKWSVuf5vOTzTO_Bn4HPLxeFyqRIQKD",
                            ),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Pate gà King's pet",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${formatPrice(calculateTotalPrice(2))}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        decreaseQuantity(2);
                                      },
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  itemCount2.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Container(
                                  width: 30.0,
                                  height: 30.0,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blue,
                                  ),
                                  child: Center(
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        increaseQuantity(2);
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  height: 45,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, -2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      "Tiếp tục mua sắm",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: double.infinity,
                  height: 230.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[300]!,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 16.0, // Adjust the top position as needed
                        left: 25.0, // Adjust the left position as needed
                        child: Text(
                          "Mã Voucher",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 50.0, // Adjust the top position as needed
                        left: 25.0, // Adjust the left position as needed
                        child: Row(
                          children: [
                            Text(
                              "123aabvxcasdf",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              "-5%",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue, // Chọn màu cho chữ
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80.0, // Adjust the top position as needed
                        left: 25.0, // Adjust the left position as needed
                        child: Text(
                          "Tổng tiền thanh toán:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 110.0, // Adjust the top position as needed
                        left: 25.0, // Adjust the left position as needed
                        child: Text(
                          "${formatPrice(calculateTotalPrice(1) + calculateTotalPrice(2))}",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 16.0, // Adjust the bottom position as needed
                        left: 0,
                        right: 0,
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Mua hàng",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
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
    );
  }
}
