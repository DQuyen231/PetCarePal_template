import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/payment/components/paymentmethod.dart';

class SelectPaymentPage extends StatefulWidget {
  @override
  _SelectPaymentPageState createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  String selectedPaymentMethod = 'Thanh toán trực tiếp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Color(0xFF4552CB),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        color: Color(0xFF4552CB),
        child: Center(
          child: Column(
            children: [
              Text(
                'Đăng ký gói\nPremium & chặn quảng cáo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.48,
                ),
              ),
              SizedBox(height: 60),
              RadioListWidget(
                selectedPaymentMethod: selectedPaymentMethod,
                onChanged: (newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue.toString();
                  });
                },
              ),
              Container(
                width: 350,
                child: GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện khi được bấm vào "Thêm/ Quản lý thẻ tín dụng"
                    print('Thêm/ Quản lý thẻ tín dụng được bấm');
                  },
                  child: Container(
                    // padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/icons/mastercard.png', // Đường dẫn đến tệp tin icon trong assets
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(width: 16),
                        Text(
                          'Thêm/ Quản lý thẻ tín dụng',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                            width:
                                55), // Dùng Spacer để căn giữa và đẩy icon dấu cộng về phía bên phải
                        Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 24,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 80),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.payment_success);
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
