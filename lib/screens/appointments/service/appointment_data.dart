class Appointments {
  int id;
  int thuCungId;
  bool isDeleted;
  bool isCompleted;
  int? thuocId;
  Thuoc? thuoc;
  int? tiemChungId;
  TiemChung? tiemChung;
  int? buaAnId;
  BuaAn? buaAn;
  int? doKichThuocId;
  DoKichThuoc? doKichThuoc;

  Appointments({
    required this.id,
    required this.thuCungId,
    required this.isDeleted,
    required this.isCompleted,
    this.thuocId,
    this.thuoc,
    this.tiemChungId,
    this.tiemChung,
    this.buaAnId,
    this.buaAn,
    this.doKichThuocId,
    this.doKichThuoc,
  });

  factory Appointments.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return Appointments(
        id: json["Id"],
        thuCungId: json["ThuCungId"],
        isDeleted: json["IsDeleted"],
        isCompleted: json["IsCompleted"],
        thuocId: json["ThuocId"],
        thuoc: json["Thuoc"] == null ? null : Thuoc.fromJson(json["Thuoc"]),
        tiemChungId: json["TiemChungId"],
        tiemChung: json["TiemChung"] == null
            ? null
            : TiemChung.fromJson(json["TiemChung"]),
        buaAnId: json["BuaAnId"],
        buaAn: json["BuaAn"] == null ? null : BuaAn.fromJson(json["BuaAn"]),
        doKichThuocId: json["DoKichThuocId"],
        doKichThuoc: json["DoKichThuoc"] == null
            ? null
            : DoKichThuoc.fromJson(json["DoKichThuoc"]),
      );
    } else if (json is List<dynamic>) {
      return Appointments(
          id: -1, thuCungId: -1, isDeleted: false, isCompleted: false);
    } else {
      throw Exception('Invalid JSON format for appointments');
    }
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "ThuCungId": thuCungId,
        "IsDeleted": isDeleted,
        "IsCompleted": isCompleted,
        "ThuocId": thuocId,
        "Thuoc": thuoc?.toJson(),
        "TiemChungId": tiemChungId,
        "TiemChung": tiemChung?.toJson(),
        "BuaAnId": buaAnId,
        "BuaAn": buaAn?.toJson(),
        "DoKichThuocId": doKichThuocId,
        "DoKichThuoc": doKichThuoc?.toJson(),
      };
}

class Thuoc {
  int id;
  String ten;
  int soLanUongTrongNgay;
  int soVienUong;
  String thoiGianSuDung;
  DateTime ngayBatDau;
  DateTime ngayKetThuc;

  Thuoc({
    required this.id,
    required this.ten,
    required this.soLanUongTrongNgay,
    required this.soVienUong,
    required this.thoiGianSuDung,
    required this.ngayBatDau,
    required this.ngayKetThuc,
  });

  factory Thuoc.fromJson(Map<String, dynamic> json) => Thuoc(
        id: json["id"],
        ten: json["ten"],
        soLanUongTrongNgay: json["soLanUongTrongNgay"],
        soVienUong: json["soVienUong"],
        thoiGianSuDung: json["thoiGianSuDung"],
        ngayBatDau: DateTime.parse(json["ngayBatDau"]),
        ngayKetThuc: DateTime.parse(json["ngayKetThuc"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ten": ten,
        "soLanUongTrongNgay": soLanUongTrongNgay,
        "soVienUong": soVienUong,
        "thoiGianSuDung": thoiGianSuDung,
        "ngayBatDau": ngayBatDau.toIso8601String(),
        "ngayKetThuc": ngayKetThuc.toIso8601String(),
      };
}

class TiemChung {
  int id;
  String mucDich;
  String phongKham;
  DateTime ngayKham;

  TiemChung({
    required this.id,
    required this.mucDich,
    required this.phongKham,
    required this.ngayKham,
  });

  factory TiemChung.fromJson(Map<String, dynamic> json) => TiemChung(
        id: json["id"],
        mucDich: json["mucDich"],
        phongKham: json["phongKham"],
        ngayKham: DateTime.parse(json["ngayKham"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "mucDich": mucDich,
        "phongKham": phongKham,
        "ngayKham": ngayKham.toIso8601String(),
      };
}

class BuaAn {
  int id;
  String name;
  String loai;
  String cachDung;
  DateTime ngayBatDau;
  DateTime ngayKetThuc;

  BuaAn({
    required this.id,
    required this.name,
    required this.loai,
    required this.cachDung,
    required this.ngayBatDau,
    required this.ngayKetThuc,
  });

  factory BuaAn.fromJson(Map<String, dynamic> json) => BuaAn(
        id: json["id"],
        name: json["name"],
        loai: json["loai"],
        cachDung: json["cachDung"],
        ngayBatDau: DateTime.parse(json["ngayBatDau"]),
        ngayKetThuc: DateTime.parse(json["ngayKetThuc"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "loai": loai,
        "cachDung": cachDung,
        "ngayBatDau": ngayBatDau.toIso8601String(),
        "ngayKetThuc": ngayKetThuc.toIso8601String(),
      };
}

class DoKichThuoc {
  int id;
  int chieuCao;
  int canNang;
  DateTime thoiGianDo;

  DoKichThuoc({
    required this.id,
    required this.chieuCao,
    required this.canNang,
    required this.thoiGianDo,
  });

  factory DoKichThuoc.fromJson(Map<String, dynamic> json) => DoKichThuoc(
        id: json["id"],
        chieuCao: json["chieuCao"],
        canNang: json["canNang"],
        thoiGianDo: DateTime.parse(json["thoiGianDo"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chieuCao": chieuCao,
        "canNang": canNang,
        "thoiGianDo": thoiGianDo.toIso8601String(),
      };
}
