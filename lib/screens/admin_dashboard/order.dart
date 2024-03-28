class Order {
  final String orderId;
  final String userName;
  final String address;
  final String phoneNumber;
  final String productName;
  final String quantity;
  final String price;
  final String date;
  final String paymentMethod;
  final String status;

  Order({
    required this.orderId,
    required this.userName,
    required this.address,
    required this.phoneNumber,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.date,
    required this.paymentMethod,
    required this.status,
  });
}
