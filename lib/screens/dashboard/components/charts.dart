import 'package:flutter/material.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/dashboard/widgets/bar_chart.dart';
import 'package:petcarepal/screens/dashboard/widgets/pie_chart.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    if (_size.width >= screenLg) {
      return Row(
        children: [
          Flexible(flex: 1, child: BarChartSample()),
          SizedBox(
            width: componentPadding,
          ),
          Flexible(
            flex: 1,
            child: MyPieChart(),
          ),
        ],
      );
    }

    return Column(
      children: [
        BarChartSample(),
        SizedBox(
          height: componentPadding,
        ),
        MyPieChart(),
      ],
    );
  }
}
