import 'dart:async';
import 'package:flutter/material.dart';
import 'order.dart';
import 'service.dart';
import 'package:intl/intl.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({Key? key});

  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  late Future<List<Order>> futureOrder;

  @override
  void initState() {
    super.initState();
    futureOrder = fetchOrder();
  }

  String getStatusString(bool status) {
    return status ? 'Accepted' : 'Declined';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thống kê doanh thu',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Phần tiêu đề
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
                        double totalRevenue = 0;
                        int amount = snapshot.data!.length;
                        for (var order in snapshot.data!) {
                          totalRevenue += order.tongSoTien;
                        }
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Revenue: \$${totalRevenue.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                            Text(
                              'Amount: $amount',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800],
                              ),
                            ),
                          ],
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
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              final order = snapshot.data![index];
                              return Container(
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          '\$${order.tongSoTien}',
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
                              );
                            },
                          ),
                        ],
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
    return status ? Colors.green[100] : Colors.red[100];
  }
}
