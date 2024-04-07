import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/QR/qr_screen.dart';
import 'package:petcarepal/screens/admin_dashboard/dashboard.dart';
import 'package:petcarepal/screens/admin_dashboard/manage_orders.dart';
import 'package:petcarepal/screens/appointments/service/appointment_data.dart';
import 'package:petcarepal/screens/booking_form/skin_form.dart';
import 'package:petcarepal/screens/booking_form/neutri_form.dart';
import 'package:petcarepal/screens/booking_form/medicine_form.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/calendar/calendar.dart';
import 'package:petcarepal/screens/dashboard/pages/dashboard.dart';
import 'package:petcarepal/screens/dashboard/pages/dashboard.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/payment/components/paymentmethod.dart';
import 'package:petcarepal/screens/payment_test/payment.dart';
import 'package:petcarepal/screens/personal_pet/components/add_pet.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';
import 'package:petcarepal/screens/premium/premium.dart';
import 'package:petcarepal/screens/select_pet/select_pet.dart';
import 'package:petcarepal/screens/signin/signin.dart';
import 'package:petcarepal/screens/signup/signup.dart';
import 'package:petcarepal/screens/splash/splash.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';
import 'package:petcarepal/screens/payment/payment.dart';
import 'package:petcarepal/screens/appointments/appointments.dart';
import 'package:petcarepal/screens/user_profile/admin_profile.dart';
import 'package:petcarepal/screens/user_profile/profile.dart';
import 'package:petcarepal/screens/edit_user_profile/edit_user_profile.dart';
import 'package:petcarepal/screens/pet_shop/pet_shop.dart';
import 'package:petcarepal/screens/user_order_history/user_order_history.dart';
import 'package:petcarepal/screens/pet_profile/pet_chart.dart';

import 'dart:io';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Dashboard',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: primary,
          textTheme: TextTheme().apply(bodyColor: textColor),
          backgroundColor: Colors.yellow),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 245, 244, 247)),
      //   useMaterial3: true,
      // ),

      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.cart,
      routes: AppRoutes.getRoutes(),
      home: SignInScreen(),
    );
  }
}
