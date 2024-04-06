import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'user_order_history.dart'; // Thay thế bằng đường dẫn đến tệp chứa lớp Order nếu khác

class UserOrderHistoryDetailPage extends StatelessWidget {
  final UserOrders order;

  const UserOrderHistoryDetailPage({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        DateFormat('dd/MM/yyyy HH:mm').format(order.ngayOrder);

    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết giao dịch'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mã đơn hàng: ${order.id}',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ngày đặt hàng: $formattedDate',
              style: TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thông tin đơn hàng:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Phương thức thanh toán: ${order.phuongThucThanhToan}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Địa chỉ: ${order.diaChi}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Tổng số tiền: ${order.tongSoTien}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Nội dung: ${order.noiDung}',
              style: TextStyle(fontSize: 16),
            ),
            Text(
              'Trạng thái: ${order.trangThai ? 'Hoàn thành' : 'Chưa hoàn thành'}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
