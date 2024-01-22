// import 'package:flutter/material.dart';

// class InfoAppointment extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 335,
//       height: 318,
//       child: Stack(
//         children: [
//           Positioned(
//             top: 20.0,
//             left: 30.0,
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Column chứa avatar và hai dòng văn bản
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     CircleAvatar(
//                       radius: 32.0,
//                       backgroundImage: AssetImage('assets/images/avatar.png'),
//                     ),
//                     SizedBox(height: 4),
//                     Text(
//                       'Tommy',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF070821),
//                         fontSize: 13,
//                         fontWeight: FontWeight.w600,
//                         height: 0,
//                         letterSpacing: 0.13,
//                       ),
//                     ),
//                     SizedBox(height: 8),
//                     Text(
//                       'Golden Retriever',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFFBBC3CE),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 0.12,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   width: 20,
//                 ),
//                 // Column chứa hai dòng văn bản, căn lề trái
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Phòng khám thú y',
//                       style: TextStyle(
//                         color: Color(0xFF070821),
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                         height: 0,
//                         letterSpacing: 0.36,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 8,
//                     ),
//                     Text(
//                       'Khám da liễu',
//                       style: TextStyle(
//                         color: Color(0xFF070821),
//                         fontSize: 12,
//                         fontWeight: FontWeight.w400,
//                         height: 0.12,
//                         letterSpacing: 0.24,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 26,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xFFF0EFF8),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               'assets/icons/map_pin.png',
//                               width: 24,
//                               height: 24,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Text(
//                           '1.5 km',
//                           style: TextStyle(
//                             color: Color(0xFF070821),
//                             fontSize: 11,
//                             fontWeight: FontWeight.w500,
//                             height: 0.13,
//                             letterSpacing: 0.40,
//                           ),
//                         ),
//                         SizedBox(
//                           width: 25,
//                         ),
//                         Container(
//                           width: 24,
//                           height: 24,
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Color(0xFFF0EFF8),
//                           ),
//                           child: Center(
//                             child: Image.asset(
//                               'assets/icons/wallet.png',
//                               width: 24,
//                               height: 24,
//                             ),
//                           ),
//                         ),
//                         SizedBox(width: 4),
//                         Text(
//                           '\$20',
//                           style: TextStyle(
//                             color: Color(0xFF070821),
//                             fontSize: 11,
//                             fontWeight: FontWeight.w500,
//                             height: 0.13,
//                             letterSpacing: 0.40,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           SizedBox(height: 30),
//           Positioned(
//             top: 145,
//             left: 20,
//             child: Container(
//               width: 295,
//               height: 112,
//               child: Stack(
//                 children: [
//                   Positioned(
//                     top: 15,
//                     left: 20,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 36,
//                               height: 36,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xFFF0EFF8),
//                               ),
//                               child: Center(
//                                 child: Image.asset(
//                                   'assets/icons/wallet.png',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 8),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Phòng khám thú y',
//                                   style: TextStyle(
//                                     color: Color(0xFF070821),
//                                     fontSize: 14,
//                                     fontWeight: FontWeight.w600,
//                                     height: 0,
//                                   ),
//                                 ),
//                                 SizedBox(height: 8),
//                                 Text(
//                                   'TP. HCM',
//                                   style: TextStyle(
//                                     color: Color(0xFF070821),
//                                     fontSize: 12,
//                                     fontWeight: FontWeight.w400,
//                                     height: 0.12,
//                                     letterSpacing: 0.24,
//                                   ),
//                                 )
//                               ],
//                             )
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 36,
//                               height: 36,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: Color(0xFFF0EFF8),
//                               ),
//                               child: Center(
//                                 child: Image.asset(
//                                   'assets/icons/border_clock.png',
//                                   width: 24,
//                                   height: 24,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(width: 8),
//                             Text(
//                               'thứ 5 ngày 15 tháng 9 — 09:30 am',
//                               style: TextStyle(
//                                 color: Color(0xFF070821),
//                                 fontSize: 12,
//                                 fontFamily: 'Encode Sans',
//                                 fontWeight: FontWeight.w400,
//                                 height: 0.12,
//                                 letterSpacing: 0.24,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               decoration: ShapeDecoration(
//                 color: Color.fromRGBO(248, 247, 251, 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(14),
//                 ),
//                 shadows: [
//                   BoxShadow(
//                     color: Color(0x0A2E1E7A),
//                     blurRadius: 12,
//                     offset: Offset(5, 3),
//                     spreadRadius: 0,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           Positioned(
//             top: 265,
//             left: 20,
//             child: Row(
//               children: [
//                 Container(
//                   width: 140,
//                   height: 34,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Xử lý khi nút được nhấp vào
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color.fromRGBO(240, 240, 248, 1),
//                       foregroundColor: Color.fromARGB(255, 0, 0, 0),
//                     ),
//                     child: Text(
//                       'Xóa',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold, // In đậm chữ
//                         fontSize: 16, // Phóng to kích thước chữ
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(width: 15),
//                 Container(
//                   width: 140,
//                   height: 34,
//                   child: ElevatedButton(
//                     onPressed: () {
//                       // Xử lý khi nút được nhấp vào
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFF4552CB),
//                       foregroundColor: Colors.white,
//                     ),
//                     child: Text(
//                       'Chỉnh sửa',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold, // In đậm chữ
//                         fontSize: 16, // Phóng to kích thước chữ
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//       decoration: ShapeDecoration(
//         color: Colors.white,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(14),
//         ),
//         shadows: [
//           BoxShadow(
//             color: Color(0x0A2E1E7A),
//             blurRadius: 12,
//             offset: Offset(5, 3),
//             spreadRadius: 0,
//           )
//         ],
//       ),
//     );
//   }
// }

// info_appointment.dart
import 'package:flutter/material.dart';
import 'circle_avatar_widget.dart';
import 'appointment_info_widget.dart';
import 'appointment_schedule_widget.dart';

class InfoAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 318,
      child: Stack(
        children: [
          Positioned(
            top: 20.0,
            left: 30.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatarWidget(),
                SizedBox(
                  width: 20,
                ),
                AppointmentInfoWidget(),
              ],
            ),
          ),
          SizedBox(height: 30),
          Positioned(
            top: 145,
            left: 20,
            child: AppointmentScheduleWidget(),
          ),
          Positioned(
            top: 265,
            left: 20,
            child: Row(
              children: [
                Container(
                  width: 140,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nút được nhấp vào
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(240, 240, 248, 1),
                      foregroundColor: Color.fromARGB(255, 0, 0, 0),
                    ),
                    child: Text(
                      'Xóa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // In đậm chữ
                        fontSize: 16, // Phóng to kích thước chữ
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 15),
                Container(
                  width: 140,
                  height: 34,
                  child: ElevatedButton(
                    onPressed: () {
                      // Xử lý khi nút được nhấp vào
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4552CB),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      'Chỉnh sửa',
                      style: TextStyle(
                        fontWeight: FontWeight.bold, // In đậm chữ
                        fontSize: 16, // Phóng to kích thước chữ
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x0A2E1E7A),
            blurRadius: 12,
            offset: Offset(5, 3),
            spreadRadius: 0,
          )
        ],
      ),
    );
  }
}
