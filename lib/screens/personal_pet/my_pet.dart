import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/personal_pet/components/add_pet.dart';
import 'package:petcarepal/screens/personal_pet/components/header.dart';
import 'package:petcarepal/screens/personal_pet/components/pet_container.dart';

class MyPet extends StatefulWidget {
  const MyPet({Key? key}) : super(key: key);

  @override
  _MyPetState createState() => _MyPetState();
}

class _MyPetState extends State<MyPet> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.height * 0.9;

    return Scaffold(
      backgroundColor: Color.fromARGB(248, 247, 251, 255),
      body: Container(
        height: containerWidth,
        child: Column(
          children: [
            Header(),
            SizedBox(height: 10),
            PetContainer(),
            AddPet(),

            // Add your custom bottom navigation here
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: currentIndex,
        onTabSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationItem(
            icon: Icon(Icons.pets),
            label: 'Thú cưng',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.calendar_today),
            label: 'Đặt lịch',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Mua sắm',
          ),
          BottomNavigationItem(
            icon: Icon(Icons.account_box),
            label: 'Hồ sơ',
          ),
          // Add more items as needed
        ],
      ),
    );
  }
}
