import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/constants/constants.dart';
import 'package:petcarepal/screens/dashboard/models/menu_item.dart';
import 'package:petcarepal/screens/dashboard/widgets/status_card.dart';

final List<BussinessStatus> statusList = [
  BussinessStatus('Pending', '11\$', Icons.show_chart_outlined),
  BussinessStatus('Total Profit', '11234 \$', Icons.attach_money_outlined),
  // BussinessStatus('Orders', '1236', Icons.shopping_cart_outlined),
  BussinessStatus('Membership', '23', Icons.people_outline_outlined),
];

class StatusList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          children: [
            Text(
              'Weekly',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 14),
            Text('Monthly',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              width: 14,
            ),
            Text('Yearly',
                style: TextStyle(
                  fontSize: 16,
                )),
          ],
        ),
        SizedBox(
          height: componentPadding,
        ),
        StaggeredGridView.countBuilder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 4,
            mainAxisSpacing: componentPadding,
            crossAxisSpacing: componentPadding,
            itemCount: statusList.length,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    if (statusList[index].name == 'Pending') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.pending_order,
                      );
                    } else if (statusList[index].name == 'Total Profit') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.all_order,
                      );
                    } else if (statusList[index].name == 'Membership') {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.membership,
                      );
                    }
                    ;
                  },
                  child: StatusCard(statusList[index]),
                ),
            staggeredTileBuilder: (index) {
              if (_size.width > screenXxl) return StaggeredTile.fit(1);
              if (_size.width > screenSm) return StaggeredTile.fit(2);
              return StaggeredTile.fit(4);
            })
      ],
    );
  }
}
