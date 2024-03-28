class Order {
  int id;
  int userId;
  String phuongThucThanhToan;
  String diaChi;
  double tongSoTien;
  dynamic noiDung;
  bool trangThai;
  DateTime ngayOrder;

  Order({
    required this.id,
    required this.userId,
    required this.phuongThucThanhToan,
    required this.diaChi,
    required this.tongSoTien,
    required this.noiDung,
    required this.trangThai,
    required this.ngayOrder,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json["id"],
        userId: json["userId"],
        phuongThucThanhToan: json["phuongThucThanhToan"],
        diaChi: json["diaChi"],
        tongSoTien: json["tongSoTien"]?.toDouble(),
        noiDung: json["noiDung"],
        trangThai: json["trangThai"],
        ngayOrder: DateTime.parse(json["ngayOrder"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "phuongThucThanhToan": phuongThucThanhToan,
        "diaChi": diaChi,
        "tongSoTien": tongSoTien,
        "noiDung": noiDung,
        "trangThai": trangThai,
        "ngayOrder": ngayOrder.toIso8601String(),
      };
}
