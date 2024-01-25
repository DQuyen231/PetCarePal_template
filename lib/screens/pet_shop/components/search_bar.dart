import 'package:flutter/material.dart';
import 'filter_button.dart';

class SearchBarWithFilter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.0, bottom: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: BorderSide(color: Color(0xFF4552CB)),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 10.0),
              ),
            ),
          ),
          SizedBox(width: 8.0),
          FilterButton(
            onPressed: () {
              _showFilterOptions(context);
            },
          ),
        ],
      ),
    );
  }

  void _showFilterOptions(BuildContext context) {
    // Đặt mã xử lý hiển thị hộp thoại hoặc menu chọn lựa ở đây
    // Bạn có thể sử dụng AlertDialog, BottomSheet, hoặc PopupMenuButton tùy thuộc vào yêu cầu của bạn
  }
}
