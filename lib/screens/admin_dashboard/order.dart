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

class OrderDetails {
  int id;
  int soLuong;
  double soTien;
  int orderId;
  int sanPhamId;
  SanPham sanPham;

  OrderDetails({
    required this.id,
    required this.soLuong,
    required this.soTien,
    required this.orderId,
    required this.sanPhamId,
    required this.sanPham,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) => OrderDetails(
        id: json["id"],
        soLuong: json["soLuong"],
        soTien: json["soTien"]?.toDouble(),
        orderId: json["orderId"],
        sanPhamId: json["sanPhamId"],
        sanPham: SanPham.fromJson(json["sanPham"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "soLuong": soLuong,
        "soTien": soTien,
        "orderId": orderId,
        "sanPhamId": sanPhamId,
        "sanPham": sanPham.toJson(),
      };
}

class SanPham {
  int id;
  String ten;
  String thuongHieu;
  String mota;
  int giaTien;
  int soLuong;
  String hinhAnhUrl;
  int loaiSanPhamId;
  dynamic loaiSanPham;

  SanPham({
    required this.id,
    required this.ten,
    required this.thuongHieu,
    required this.mota,
    required this.giaTien,
    required this.soLuong,
    required this.hinhAnhUrl,
    required this.loaiSanPhamId,
    required this.loaiSanPham,
  });

  factory SanPham.fromJson(Map<String, dynamic> json) => SanPham(
        id: json["id"],
        ten: json["ten"],
        thuongHieu: json["thuongHieu"],
        mota: json["mota"],
        giaTien: json["giaTien"],
        soLuong: json["soLuong"],
        hinhAnhUrl: json["hinhAnhUrl"],
        loaiSanPhamId: json["loaiSanPhamId"],
        loaiSanPham: json["loaiSanPham"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten,
        "thuongHieu": thuongHieu,
        "mota": mota,
        "giaTien": giaTien,
        "soLuong": soLuong,
        "hinhAnhUrl": hinhAnhUrl,
        "loaiSanPhamId": loaiSanPhamId,
        "loaiSanPham": loaiSanPham,
      };
}
