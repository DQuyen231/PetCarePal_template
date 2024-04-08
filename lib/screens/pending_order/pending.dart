import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:petcarepal/config/app_routes.dart';
import 'package:petcarepal/screens/admin_dashboard/order_detail.dart';
import 'package:petcarepal/screens/admin_dashboard/order.dart';
import 'package:petcarepal/screens/admin_dashboard/service.dart';

class PendingOrders extends StatefulWidget {
  const PendingOrders({Key? key});

  @override
  _PendingOrderState createState() => _PendingOrderState();
}

class _PendingOrderState extends State<PendingOrders> {
  late Future<List<Order>> futureOrder;
  List<Order> _orders = [];

  @override
  void initState() {
    super.initState();
    futureOrder = fetchPendingOrder();
  }

  String getStatusString(bool status) {
    return status ? 'Accepted' : 'Pending';
  }

  void _updateOrderStatus(int orderId, bool newStatus) {
    setState(() {
      final index = _orders.indexWhere((order) => order.id == orderId);
      if (index != -1) {
        _orders[index].trangThai = newStatus;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thống kê doanh thu chưa hoàn thành',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context, AppRoutes.admin);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RECENT ORDERS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 1),
                Text(
                  'Below are your most recent orders',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600]),
                ),
                SizedBox(height: 6),
                Container(
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey[300]!,
                      width: 1.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: FutureBuilder<List<Order>>(
                    future: futureOrder,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        int amount = snapshot.data!.length;
                        return Text(
                          'Amount: $amount',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.0),
            Expanded(
              child: FutureBuilder<List<Order>>(
                future: futureOrder,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SingleChildScrollView(
                      child: Column(
                        children: List.generate(snapshot.data!.length, (index) {
                          final order = snapshot.data![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OrderDetailPage(
                                    order: order,
                                    updateOrderStatus: _updateOrderStatus,
                                    order_id: order.id,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1.0,
                                ),
                              ),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8.0),
                              margin: EdgeInsets.symmetric(vertical: 4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Order #: ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.grey[600],
                                            ),
                                          ),
                                          Text(
                                            '${order.id}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                              color: Colors.blue[800],
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        '${DateFormat('dd/MM/yyyy HH:mm').format(order.ngayOrder)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      )
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '\đ${order.tongSoTien * 1000}',
                                        style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Container(
                                        alignment: Alignment.center,
                                        width: 80,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          color:
                                              getStatusColor(order.trangThai),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.0, vertical: 4.0),
                                        child: Text(
                                          getStatusString(order.trangThai),
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? getStatusColor(bool status) {
    return status ? Colors.green[100] : Colors.blue[100];
  }
}
