import 'package:flutter/material.dart';
import 'package:petcarepal/screens/admin_dashboard/order.dart';

class ManageOrder extends StatefulWidget {
  const ManageOrder({Key? key}) : super(key: key);

  @override
  _ManageOrderState createState() => _ManageOrderState();
}

class _ManageOrderState extends State<ManageOrder> {
  List<Order> orders = []; // List to store orders fetched from API

  @override
  void initState() {
    super.initState();
    // Fetch orders from API and populate the orders list
    fetchOrders();
  }

  void fetchOrders() {
    // Simulated API call to fetch orders
    // Replace this with actual API call
    List<Order> fetchedOrders = [
      Order(
        price: '\$50',
        date: '2024-03-20',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
      Order(
        price: '\$100',
        date: '2024-03-19',
        paymentMethod: 'PayPal',
        status: 'Delivered',
      ),
      Order(
        price: '\$75',
        date: '2024-03-18',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
      Order(
        price: '\$80',
        date: '2024-03-05',
        paymentMethod: 'PayPal',
        status: 'Pending',
      ),
      Order(
        price: '\$72',
        date: '2024-02-20',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
      Order(
        price: '\$60',
        date: '2024-02-18',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
      Order(
        price: '\$80',
        date: '2024-03-10',
        paymentMethod: 'Paypal',
        status: 'Pending',
      ),
      Order(
        price: '\$30',
        date: '2024-02-16',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
      Order(
        price: '\$90',
        date: '2024-03-14',
        paymentMethod: 'Cash on Delivery',
        status: 'Pending',
      ),
    ];
    setState(() {
      orders = fetchedOrders;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Manage Orders'),
          centerTitle: true,
          backgroundColor: Colors.grey[200],
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey[200],
          ),
          child: ListView.builder(
            itemCount: orders.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('Price: ${orders[index].price}'),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Date: ${orders[index].date}'),
                      Text('Payment Method: ${orders[index].paymentMethod}'),
                      Text('Status: ${orders[index].status}'),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
