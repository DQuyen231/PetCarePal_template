import 'package:flutter/material.dart';
import 'package:petcarepal/constants/constants.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Store Dashboard',
      theme: ThemeData(
          fontFamily: 'Nunito',
          primaryColor: primary,
          textTheme: TextTheme().apply(bodyColor: textColor),
          backgroundColor: Colors.yellow),
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}
