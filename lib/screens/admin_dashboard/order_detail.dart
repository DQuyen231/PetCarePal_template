import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/screens/admin_dashboard/service.dart';
import 'order.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void _updateOrderStatus(
    BuildContext context, int orderId, bool newStatus) async {
  final apiUrl = 'https://54.206.249.179/order/$orderId';

  try {
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'id': orderId,
        'trangThai': newStatus,
      }),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Order status updated successfully'),
        duration: Duration(seconds: 2),
      ));
    } else {
      print(
          'Failed to update order status. Error code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error while updating order status: $e');
  }
}

class OrderDetailPage extends StatefulWidget {
  final Order order;
  final Function(int, bool) updateOrderStatus;
  final int order_id;

  const OrderDetailPage(
      {Key? key,
      required this.order,
      required this.updateOrderStatus,
      required this.order_id})
      : super(key: key);

  @override
  _OrderDetailPageState createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  AdminApi _api = AdminApi();
  List<dynamic> itemOrder = [];

  void _fetchItemOrder() async {
    try {
      var result = await _api.getItemOrder(widget.order_id);
      setState(() {
        itemOrder = result;
      });
    } catch (e) {
      print('Error fetching item order: $e');
      // Handle error accordingly
    }
  }

  void initState() {
    super.initState();
    _fetchItemOrder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Chi tiết đơn hàng',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Order Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 8),
            _buildOrderInfoRow('Order #:', widget.order.id),
            _buildOrderInfoRow('User ID:', widget.order.userId),
            _buildOrderInfoRow(
                'Payment Method:', widget.order.phuongThucThanhToan),
            _buildOrderInfoRow('Address:', widget.order.diaChi),
            _buildOrderInfoRow('Order Date:', widget.order.ngayOrder),
            _buildOrderInfoRow('Total Amount:', '\$${widget.order.tongSoTien}'),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildOrderInfoRow(
                    'Order Status:',
                    widget.order.trangThai != null
                        ? (widget.order.trangThai ? 'Accepted' : 'Pending')
                        : 'N/A',
                    color: widget.order.trangThai != null
                        ? (widget.order.trangThai ? Colors.green : Colors.blue)
                        : null,
                  ),
                ),
                if (widget.order.trangThai == false)
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Xác nhận cập nhật trạng thái'),
                            content: Text(
                                'Bạn có chắc chắn muốn cập nhật trạng thái đơn hàng không?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Hủy'),
                              ),
                              TextButton(
                                onPressed: () {
                                  _updateOrderStatus(context, widget.order.id,
                                      !widget.order.trangThai);
                                  Navigator.of(context).pop();
                                  setState(() {
                                    widget.order.trangThai =
                                        !widget.order.trangThai;
                                  });
                                  // Gọi hàm callback để thông báo cập nhật trạng thái đơn hàng trên trang quản lý đơn hàng
                                  widget.updateOrderStatus(
                                      widget.order.id, !widget.order.trangThai);
                                },
                                child: Text('Đồng ý'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.update),
                    tooltip: widget.order.trangThai
                        ? 'Mark as Pending'
                        : 'Mark as Accepted',
                  ),
              ],
            ),
            SizedBox(height: 24),
            Text(
              'Order Content',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue[800],
              ),
            ),
            SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              itemCount: itemOrder.length,
              itemBuilder: (context, index) {
                var orderItem = itemOrder[index];
                var sanpham = orderItem['sanPham']['ten'];
                print(sanpham);
                var soluong = orderItem['soLuong'];
                return ListTile(
                  title: Text(
                    sanpham,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text('Số lượng: $soluong'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOrderInfoRow(String label, dynamic value, {Color? color}) {
    String displayValue = '';

    if (value is DateTime) {
      displayValue = DateFormat('dd/MM/yyyy HH:mm').format(value);
    } else {
      displayValue = value?.toString() ?? 'N/A';
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              displayValue,
              style: TextStyle(
                fontSize: 16,
                color: color ?? Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
