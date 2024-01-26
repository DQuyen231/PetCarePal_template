import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 279,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x142C358A),
            blurRadius: 28,
            offset: Offset(4, 6),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 8,
            right: 8,
            child: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                // Xử lý sự kiện khi nút edit được nhấp
              },
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Đảm bảo căn giữa theo chiều dọc
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                SizedBox(height: 16),
                Text(
                  'Tommy',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF070821),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  'Golden Retriever',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFBBC3CE),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
