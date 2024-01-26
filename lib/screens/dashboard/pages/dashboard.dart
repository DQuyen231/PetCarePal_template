import 'package:flutter/material.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/dashboard/components/charts.dart';
import 'package:petcarepal/screens/dashboard/components/status_list.dart';
import 'package:petcarepal/screens/dashboard/layout/main_layout.dart';
import '../components/order_table.dart';

class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        StatusList(),
        Charts(),
        SizedBox(
          height: componentPadding,
        ),
        OrderTable(),
      ],
    ));
  }
}
