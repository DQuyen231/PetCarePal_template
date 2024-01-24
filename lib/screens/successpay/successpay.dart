import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

class PaymentSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF4552CB),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 50.0,
                child: Image.asset(
                  'assets/icons/check.png',
                  width:
                      80, // Điều chỉnh kích thước hình ảnh theo nhu cầu của bạn
                  height: 80,
                ),
              ),
              SizedBox(height: 20), // Khoảng cách giữa hình và văn bản
              Text(
                'Thanh toán thành công',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 70),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.account);
                },
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.white),
                  padding: EdgeInsets.symmetric(horizontal: 85, vertical: 15),
                ),
                child: Text(
                  'Xác nhận',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
