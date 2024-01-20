import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_type/booking_type.dart';
import 'package:petcarepal/screens/home/home.dart';
import 'package:petcarepal/screens/pet_profile/pet_profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(
      //       seedColor: const Color.fromARGB(255, 245, 244, 247)),
      //   useMaterial3: true,
      // ),
      debugShowCheckedModeBanner: false,
      home: PetProfile(),
    );
  }
}
