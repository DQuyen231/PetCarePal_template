import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/QR/momo_non_id.dart';
import 'package:petcarepal/screens/QR/qr_non_id.dart';
import 'package:petcarepal/screens/QR/qr_screen.dart';
import 'package:petcarepal/screens/payment/components/paymentmethod.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';
import 'package:petcarepal/screens/payment/service/payment_service.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SelectPaymentPage extends StatefulWidget {
  @override
  _SelectPaymentPageState createState() => _SelectPaymentPageState();
}

class _SelectPaymentPageState extends State<SelectPaymentPage> {
  String selectedPaymentMethod = 'Thanh toán trực tiếp';
  final _api = PaymentApi();

  Future<int?> getUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('userId');
  }

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
                onPressed: () async {
                  if (selectedPaymentMethod == 'Ví Momo') {
                    int? userId = await getUserId();

                    _api.buyPremiumAccount(userId);

                    _api.createOrderByMoMo(userId);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MomoScreenNonId()));
                  } else if (selectedPaymentMethod == 'Ví MBbank') {
                    int? userId = await getUserId();

                    _api.buyPremiumAccount(userId);

                    _api.createOrder(userId);

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                QRNonIdScreen()));
                  } else if (selectedPaymentMethod == 'Ví Paypal') {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => PaypalCheckout(
                        sandboxMode: true,
                        clientId:
                            "AXDL2o7EtwXca6d68-oGKQyKWCH-mtmEv5bPGFElxKJi96o5LlF7BwLiXdR2bZOKkEqOfDhKfKVc3r3u",
                        secretKey:
                            "EGZhWVu_DOWBn8h6HoG2xD_gBoZmEa-prCa8-PK7oIUgD91fdhkfDycYpVGxjg2f5l6BOV9txawKsfwF",
                        returnURL: AppRoutes.payment_success,
                        cancelURL: "cancel.snippetcoder.com",
                        transactions: const [
                          {
                            "amount": {
                              "total": '3',
                              "currency": "USD",
                              "details": {
                                "subtotal": '3',
                                "shipping": '0',
                                "shipping_discount": 0
                              }
                            },
                            "description":
                                "The payment transaction description.",
                            // "payment_options": {
                            //   "allowed_payment_method":
                            //       "INSTANT_FUNDING_SOURCE"
                            // },
                            "item_list": {
                              "items": [
                                {
                                  "name": "Premium account",
                                  "quantity": 1,
                                  "price": '3',
                                  "currency": "USD"
                                },
                                // {
                                //   "name": "Pineapple",
                                //   "quantity": 5,
                                //   "price": '10',
                                //   "currency": "USD"
                                // }
                              ],

                              // shipping address is not required though
                              //   "shipping_address": {
                              //     "recipient_name": "Raman Singh",
                              //     "line1": "Delhi",
                              //     "line2": "",
                              //     "city": "Delhi",
                              //     "country_code": "IN",
                              //     "postal_code": "11001",
                              //     "phone": "+00000000",
                              //     "state": "Texas"
                              //  },
                            }
                          }
                        ],
                        note: "Contact us for any questions on your order.",
                        onSuccess: (Map params) async {
                          print("onSuccess hahahaha: $params");
                          // if (params.containsKey('data') &&
                          //     params['data'] is Map) {
                          // String orderId = params['data']['id'];

                          int? userId = await getUserId();
                          _api.buyPremiumAccount(userId);

                          _api.createOrder(userId);

                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                PaymentSuccessPage(),
                          ));

                          // print("onSuccess: Order ID - $orderId");

                          // } else {
                          //   print("onSuccess: Data not found or invalid format");
                          // }
                        },
                        onError: (error) {
                          print("onError: $error");
                          Navigator.pop(context);
                        },
                        onCancel: () {
                          print('cancelled:');
                        },
                      ),
                    ));
                  }
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
