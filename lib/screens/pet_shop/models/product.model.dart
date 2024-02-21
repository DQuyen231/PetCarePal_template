class ProductModelTest {
  final int id;
  final String name;
  final String brand;
  final String description;
  final double price;
  final int quantity;
  final String imageUrl;
  final int categoryId;
  final CategoryModel category;

  ProductModelTest({
    required this.id,
    required this.name,
    required this.brand,
    required this.description,
    required this.price,
    required this.quantity,
    required this.imageUrl,
    required this.categoryId,
    required this.category,
  });

  factory ProductModelTest.fromJson(Map<String, dynamic> json) {
    return ProductModelTest(
      id: json['id'],
      name: json['ten'],
      brand: json['thuongHieu'],
      description: json['mota'],
      price: json['giaTien']?.toDouble() ?? 0.0,
      quantity: json['soLuong'] ?? 0,
      imageUrl: json['hinhAnhUrl'],
      categoryId: json['loaiSanPhamId'],
      category: CategoryModel.fromJson(json['loaiSanPham']),
    );
  }
}

class CategoryModel {
  final int id;
  final String name;

  CategoryModel({
    required this.id,
    required this.name,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['ten'],
    );
  }
}
