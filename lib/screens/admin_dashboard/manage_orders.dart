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
        orderId: 'ưehuifkyriughf84',
        userName: 'Hà Nữ Như Quỳnh',
        phoneNumber: '058-203-1930',
        address: '197/42/26 TL.15, P.Thạnh Lộc, Q.12, TP.HCM',
        productName: 'Cát mèo Katz Comfort',
        quantity: '1',
        price: '80.000đ',
        date: '2024-03-20',
        paymentMethod: 'Internet Banking',
        status: 'Pending',
      ),
      Order(
        orderId: 'gycgw734hgiw',
        userName: 'Nguyễn Thị Mai Hương',
        phoneNumber: '081-221-1227',
        address: '320/43 Đoàn Văn Bơ, P.10, Q.4, TP.HCM',
        productName: 'Phô mai viên Smart Heart Cheddar Cube gói 50g',
        quantity: '2',
        price: '66.000đ',
        date: '2024-03-20',
        paymentMethod: 'Internet Banking',
        status: 'Pending',
      ),
      Order(
        orderId: 'hjeg358fg349fn',
        userName: 'Nguyễn Thái Bảo Thi',
        phoneNumber: '083-355-3738',
        address: '403 Nơ Trang Long, P.10, Q.Bình Thạnh, TP.HCM',
        productName: 'Cát đậu phụ Cute Tabby',
        quantity: '1',
        price: '85.000đ',
        date: '2024-03-20',
        paymentMethod: 'Internet Banking',
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
                elevation: 4, // Độ nổi bật của card
                margin: EdgeInsets.symmetric(
                    vertical: 8, horizontal: 16), // Khoảng cách giữa các card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Bo góc card
                ),
                child: ListTile(
                  contentPadding: EdgeInsets.all(
                      16), // Khoảng cách từ biên của card đến nội dung bên trong
                  title: Text(
                    'Mã đơn hàng: ${orders[index].orderId}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold, // Chữ in đậm
                      fontSize: 18, // Kích cỡ chữ
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8), // Khoảng cách giữa các dòng
                      Text(
                        'Tên khách hàng: ${orders[index].userName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Chữ in đậm
                          fontSize: 16, // Kích cỡ chữ
                        ), // Kích cỡ chữ
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Địa chỉ giao hàng: ${orders[index].address}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Số điện thoại: ${orders[index].phoneNumber}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      Text(
                        'Tên sản phẩm: ${orders[index].productName}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold, // Chữ in đậm
                          fontSize: 16, // Kích cỡ chữ
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Số lượng: ${orders[index].quantity}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Giá tiền: ${orders[index].price}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Ngày đặt: ${orders[index].date}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Phương thức thanh toán: ${orders[index].paymentMethod}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Text(
                            'Trang thái: ',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          // Thêm biểu tượng hoặc màu sắc cho trạng thái để làm nổi bật
                          orders[index].status == 'Delivered'
                              ? Icon(Icons.check_circle, color: Colors.green)
                              : Icon(Icons.error, color: Colors.red),
                          SizedBox(width: 4),
                          Text(
                            '${orders[index].status}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: orders[index].status == 'Delivered'
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
