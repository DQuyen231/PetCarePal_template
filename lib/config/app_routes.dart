import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';
import 'package:petcarepal/screens/splash/splash.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String booking = '/booking';
  static const String success = '/success';
  static const String pet = '/my_pet';
  static const String addpet = '/add_pet';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      booking: (context) => BookingType(),
      success: (context) => PaymentSuccessPage(),
      splash: (context) => SplashScreen(),
      pet: (context) => MyPet(),
      addpet: (context) => PetProfile(),
    };
  }
}
