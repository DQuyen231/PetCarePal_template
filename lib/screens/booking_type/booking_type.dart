import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/config/bottom_navigation.dart';
import 'package:petcarepal/screens/booking_type/widgets/booking_container.dart';
import 'package:petcarepal/screens/booking_type/widgets/booking_header.dart';
import 'package:petcarepal/screens/booking_type/models/content.model.dart';
import 'package:petcarepal/screens/calendar/calendar.dart';

class BookingType extends StatefulWidget {
  BookingType({super.key});

  @override
  State<BookingType> createState() => _BookingTypeState();
}

class _BookingTypeState extends State<BookingType> {
  final content = ['Tiêm chủng', 'Dinh dưỡng', 'Thuốc', 'Da liễu'];

  // Future<Object?> getRoute(String title) {
  //   switch (title) {
  //     case 'Tiêm chủng':
  //       return Navigator.pushNamed(context, '/home');

  //     case 'Dinh dưỡng':
  //       return Navigator.pushNamed(context, AppRoutes.nutiform);

  //     case 'Thuốc':
  //       return Navigator.pushNamed(context, AppRoutes.mediform);

  //     case 'Da liễu':
  //       return Navigator.pushNamed(context, AppRoutes.skinform);
  //     default:
  //       return Navigator.pushNamed(context, '/home');
  //   }
  // }

  Content getContent(value) {
    switch (value) {
      case 'Tiêm chủng':
        return Content(
            title: 'Tiêm chủng',
            description: 'Quản lí thời gian\n loại vaccin cho thú cưng',
            image: 'assets/images/tiemchung.png');
      case 'Dinh dưỡng':
        return Content(
            title: 'Dinh dưỡng',
            description: 'Quản lí chế độ dinh dưỡng',
            image: 'assets/images/dinhduong.png');
      case 'Thuốc':
        return Content(
            title: 'Thuốc',
            description: 'Quản lí sức khỏe\n loại thuốc chức năng',
            image: 'assets/images/thuoc.png');
      case 'Da liễu':
        return Content(
            title: 'Da liễu',
            description: 'Chăm sóc, spa cho thú cưng',
            image: 'assets/images/dalieu.png');
      default:
        return Content(title: '', description: '', image: '');
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

    return Scaffold(
      // backgroundColor: Color.fromARGB(248, 247, 251, 255),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          BookingHeader(),
          Expanded(
            child: ListView.builder(
              itemCount: content.length,
              itemBuilder: (context, index) {
                String item = content[index];
                Content itemContent = getContent(item);
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Calendar(title: itemContent.title),
                      ),
                    );
                  },
                  child: BookingContainer(
                    title: itemContent.title,
                    description: itemContent.description,
                    image: itemContent.image,
                  ),
                );
              },
            ),
          ),
        ],
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
