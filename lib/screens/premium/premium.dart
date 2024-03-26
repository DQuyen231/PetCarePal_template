import 'package:flutter/material.dart';
import 'package:petcarepal/config/app_routes.dart';

// class PremiumPage extends StatelessWidget {
//   const PremiumPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Color button1BackgroundColor = Colors.white;
//     Color button2BackgroundColor = Color.fromARGB(255, 25, 61, 246);
//     Color pageBackgroundColor = Color(0xFFF8F7FB);

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         backgroundColor: pageBackgroundColor,
//         body: Padding(
//           padding: const EdgeInsets.only(top: 10.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     icon: Icon(Icons.arrow_back, color: Colors.blue),
//                     onPressed: () {
//                       Navigator.pushNamed(context, AppRoutes.account);
//                     },
//                   ),
//                   SizedBox(height: 120),
//                   SizedBox(width: 0),
//                   Expanded(
//                     child: Align(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Gói Premium',
//                         style: TextStyle(
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(width: 20),
//               Center(
//                 child: Align(
//                   alignment: Alignment(0.0, -0.6),
//                   child: Container(
//                     height: 250,
//                     width: 340,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Text(
//                             'Miễn Phí',
//                             style: TextStyle(
//                               fontSize: 26,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ),
//                         buildListItem('Giới hạn thú cưng', false),
//                         buildListItem('Giới hạn lịch trình', false),
//                         buildListItem('Quảng cáo', false),
//                         buildListItem('Không sử dụng được bản đồ', false),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 height: 330,
//                 width: 340,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Text(
//                         'Quyền Lợi',
//                         style: TextStyle(
//                           fontSize: 26,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     buildListItem('Không giới hạn thú cưng', true),
//                     buildListItem('Không giới hạn lịch trình', true),
//                     buildListItem('Không quảng cáo', true),
//                     buildListItem('Sử dụng bản đồ tiện lợi', true),
//                     buildListItem('Bật chức năng thông báo lịch', true),
//                     buildListItem('Giảm 5% tất cả các sản phẩm', true),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, AppRoutes.account);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: button1BackgroundColor,
//                     ),
//                     child: Text(
//                       'Không, cảm ơn',
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, AppRoutes.payment);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       primary: button2BackgroundColor,
//                     ),
//                     child: Text(
//                       '+ Mua 60.000đ',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget buildListItem(String text, bool showTick) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Stack(
//         children: [
//           Row(
//             children: [
//               Container(
//                 width: 10,
//                 height: 10,
//                 decoration: BoxDecoration(
//                   color: Colors.orange,
//                   shape: BoxShape.circle,
//                 ),
//               ),
//               SizedBox(width: 10),
//               Text(
//                 text,
//                 style: TextStyle(
//                   fontSize: 17,
//                   fontWeight: FontWeight.normal,
//                 ),
//               ),
//             ],
//           ),
//           if (showTick)
//             Positioned(
//               top: 0,
//               right: 0,
//               child: Container(
//                 width: 20,
//                 height: 20,
//                 decoration: BoxDecoration(
//                   color: Colors.green,
//                   shape: BoxShape.circle,
//                 ),
//                 child: Icon(
//                   Icons.check,
//                   color: Colors.white,
//                   size: 15,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }

class PremiumPage extends StatelessWidget {
  const PremiumPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gói Premium',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.account);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/premium.png',
            ),
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // Chiều rộng của container
              padding: EdgeInsets.all(20), // Padding bên trong container
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(10), // Bo viền cho container
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // Độ lệch của shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Gói Premium',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nâng cấp để trải nghiệm những tính năng đặc biệt và không giới hạn',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Xử lý khi người dùng nhấn vào nút
                    },
                    child: Text('Nâng cấp'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
