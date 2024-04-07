import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/shopping_cart/services/shopping_api.dart';

class MomoScreenNonId extends StatelessWidget {
  final String qrImageUrl =
      'assets/images/momo.png'; // URL of the QR code image

  ShoppingApi _api = ShoppingApi();

  MomoScreenNonId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              qrImageUrl, // Use the provided URL to load the QR code image
              width: 600,
              height: 600,
            ),
            SizedBox(height: 10),
            Text(
              'Scan the QR code to make a payment',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 10),
            Text(
              'Nội dung chuyển khoản: PETCAREPAL TTOAN SP10',
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 10),
            ElevatedButton(
                onPressed: () {
                  // _api.paymentByQrCode(order_id);
                  Navigator.pushNamed(context, AppRoutes.payment_success);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // Background color
                  onPrimary: Colors.white, // Text color
                  padding: EdgeInsets.symmetric(
                      horizontal: 100, vertical: 16), // Button padding
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8)), // Button border radius
                  elevation: 3, // Button elevation
                ),
                child: Text('Hoàn tất'))
          ],
        ),
      ),
    );
  }
}
