import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/personal_pet/my_pet.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = [MyPet(), BookingType(), Placeholder(), Placeholder()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.pets),
            label: 'Thú cưng',
          ),
          NavigationDestination(
              icon: Icon(Icons.calendar_today), label: 'Đặt lịch'),
          NavigationDestination(
              icon: Icon(Icons.shopping_cart), label: 'Mua sắm'),
          NavigationDestination(icon: Icon(Icons.account_box), label: 'Hồ sơ'),
        ],
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
          if (value == 2) {
            Navigator.pushNamed(context, AppRoutes.pet);
          } else if (value == 3) {
            Navigator.pushNamed(context, AppRoutes.booking);
          }
        },
      ),
    );
  }
}
