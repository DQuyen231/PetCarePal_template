import 'package:flutter/material.dart';
import 'package:petcarepal/screens/appointments/appointments.dart';
import 'package:petcarepal/screens/booking_form/medicine_form.dart';
import 'package:petcarepal/screens/booking_form/neutri_form.dart';
import 'package:petcarepal/screens/booking_form/skin_form.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/calendar/calendar.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/payment/payment.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';
import 'package:petcarepal/screens/pet_shop/pet_shop.dart';
import 'package:petcarepal/screens/premium/premium.dart';
import 'package:petcarepal/screens/shopping_cart/shopping_cart.dart';
import 'package:petcarepal/screens/signin/signin.dart';
import 'package:petcarepal/screens/splash/splash.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';
import 'package:petcarepal/screens/user_profile/profile.dart';

class AppRoutes {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String booking = '/booking';
  static const String success = '/success';
  static const String pet = '/my_pet';
  static const String addpet = '/add_pet';
  static const String login = '/login';
  static const String account = '/account';
  static const String premium = '/premium';
  static const String payment = '/payment';
  static const String payment_success = '/payment_success';
  static const String shop = '/shop';
  static const String booking_date = '/date';
  static const String cart = '/cart';
  static const String nutiform = '/nutiform';
  static const String skinform = '/skinform';
  static const String mediform = '/mediform';
  static const String appointments = '/appointments';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      home: (context) => HomeScreen(),
      booking: (context) => BookingType(),
      success: (context) => PaymentSuccessPage(),
      splash: (context) => SplashScreen(),
      pet: (context) => MyPet(),
      addpet: (context) => PetProfile(),
      login: (context) => SignInScreen(),
      account: (context) => ProfilePage(),
      premium: (context) => PremiumPage(),
      payment: (context) => SelectPaymentPage(),
      payment_success: (context) => PaymentSuccessPage(),
      shop: (context) => PetShop(),
      booking_date: (context) => Calendar(),
      cart: (context) => ShoppingCart(),
      nutiform: (context) => NeutriForm(),
      skinform: (context) => SkinForm(),
      mediform: (context) => MedicineForm(),
      appointments: (context) => UpcomingAppointmentsPage(),
    };
  }
}
