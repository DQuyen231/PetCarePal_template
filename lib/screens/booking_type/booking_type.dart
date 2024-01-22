import 'package:flutter/material.dart';
import 'package:petcarepal/screens/booking_type/widgets/booking_container.dart';
import 'package:petcarepal/screens/booking_type/widgets/booking_header.dart';
import 'package:petcarepal/screens/booking_type/models/content.model.dart';

class BookingType extends StatelessWidget {
  BookingType({super.key});

  final content = ['Tiêm chủng', 'Dinh dưỡng', 'Thuốc', 'Da liễu'];

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
                return BookingContainer(
                  title: itemContent.title,
                  description: itemContent.description,
                  image: itemContent.image,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
