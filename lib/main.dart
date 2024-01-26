import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/booking_form/skin_form.dart';
import 'package:petcarepal/screens/booking_form/neutri_form.dart';
import 'package:petcarepal/screens/booking_form/medicine_form.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/calendar/calendar.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/premium/premium.dart';
import 'package:petcarepal/screens/signin/signin.dart';
import 'package:petcarepal/screens/splash/splash.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';
import 'package:petcarepal/screens/payment/payment.dart';
import 'package:petcarepal/screens/appointments/appointments.dart';
import 'package:petcarepal/screens/user_profile/profile.dart';
import 'package:petcarepal/screens/edit_user_profile/edit_user_profile.dart';
import 'package:petcarepal/screens/pet_shop/pet_shop.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 245, 244, 247)),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
      home: MedicineForm(),
    );
  }
}
