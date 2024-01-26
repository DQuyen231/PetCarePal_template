import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

class CustomBottomNavigation extends StatefulWidget {
  final List<BottomNavigationItem> items;
  final Function(int) onTabSelected;
  final int currentIndex;

  CustomBottomNavigation({
    required this.items,
    required this.onTabSelected,
    required this.currentIndex,
  });

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: widget.items
            .asMap()
            .map((index, item) => MapEntry(
                  index,
                  Expanded(
                    child: _buildIconButton(item, index),
                  ),
                ))
            .values
            .toList(),
      ),
    );
  }

  Widget _buildIconButton(BottomNavigationItem item, int index) {
    return IconButton(
      onPressed: () {
        widget.onTabSelected(index);

        // Handle navigation to named routes here
        switch (index) {
          case 0:
            Navigator.pushNamed(context, AppRoutes.pet);
            break;
          case 1:
            Navigator.pushNamed(context, AppRoutes.booking);
            break;
          case 2:
            Navigator.pushNamed(context, AppRoutes.shop);
            break;
          case 3:
            Navigator.pushNamed(context, AppRoutes.account);
            break;
          // Add more cases as needed
        }
      },
      color:
          index == widget.currentIndex ? Theme.of(context).primaryColor : null,
      icon: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          item.icon,
          Text(
            item.label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.bold,
            ), // Adjust the font size as needed
          ),
        ],
      ),
    );
  }
}

class BottomNavigationItem {
  final Icon icon;
  final String label;

  BottomNavigationItem({
    required this.icon,
    required this.label,
  });
}
