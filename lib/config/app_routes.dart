import 'package:flutter/material.dart';
import 'package:petcarepal/screens/QR/qr_screen.dart';
import 'package:petcarepal/screens/admin_dashboard/manage_orders.dart';
import 'package:petcarepal/screens/appointments/appointments.dart';
import 'package:petcarepal/screens/booking_form/medicine_form.dart';
import 'package:petcarepal/screens/booking_form/neutri_form.dart';
import 'package:petcarepal/screens/booking_form/skin_form.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/calendar/calendar.dart';
import 'package:petcarepal/screens/dashboard/pages/dashboard.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/membership/membership.dart';
import 'package:petcarepal/screens/payment/payment.dart';
import 'package:petcarepal/screens/pending_order/pending.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';
import 'package:petcarepal/screens/pet_shop/pet_shop.dart';
import 'package:petcarepal/screens/premium/premium.dart';
import 'package:petcarepal/screens/shopping_cart/shopping_cart.dart';
import 'package:petcarepal/screens/signin/signin.dart';
import 'package:petcarepal/screens/splash/splash.dart';
import 'package:petcarepal/screens/successpay/successpay.dart';
import 'package:petcarepal/screens/user_profile/admin_profile.dart';
import 'package:petcarepal/screens/user_profile/profile.dart';
import 'package:petcarepal/screens/user_order_history/user_order_history.dart';
import 'package:petcarepal/screens/pet_profile/pet_chart.dart';

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
  static const String user_order_history = '/user_order_history';
  static const String all_order = '/all_order';
  static const String admin = '/admin_dashboard';
  static const String pending_order = '/pending_order';
  static const String membership = '/membership';
  static const String admin_profile = '/admin_profile';
  static const String pet_chart = '/pet_chart';

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
      user_order_history: (context) => UserOrderHistory(),
      all_order: (context) => ManageOrder(),
      admin: (context) => Dashboard(),
      pending_order: (context) => PendingOrders(),
      membership: (context) => Membership(),
      admin_profile: (context) => AdminProfile(),
      pet_chart: (context) => PetChart(),
    };
  }
}
