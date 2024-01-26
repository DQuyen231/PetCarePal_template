import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();

    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      iconTheme: IconThemeData(color: Color(0xFF4552CB)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(34), // Điều chỉnh độ bo góc ở đây
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 25),
          child: RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black, // Màu chung cho văn bản
              ),
              children: [
                TextSpan(
                  text: 'Ngày ',
                ),
                TextSpan(
                  text: '${currentDate.day}',
                  style: TextStyle(color: Color(0xFF4552CB)), // Màu cho ngày
                ),
                TextSpan(
                  text: ' tháng ',
                ),
                TextSpan(
                  text: '${currentDate.month}',
                  style: TextStyle(color: Color(0xFF4552CB)), // Màu cho tháng
                ),
                TextSpan(
                  text: ' năm ',
                ),
                TextSpan(
                  text: '${currentDate.year}',
                  style: TextStyle(color: Color(0xFF4552CB)), // Màu cho năm
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50.0);
}
