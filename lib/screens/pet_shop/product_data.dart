// product_data.dart
class ProductModel {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;
  final String category;
  int quantity;

  ProductModel(this.name, this.imageUrl, this.price, this.rating, this.category,
      {this.quantity = 1});
}

List<ProductModel> allProducts = [
  ProductModel(
      'Product 1A', 'assets/images/pate_cat.png', 19.99, 4.5, 'Thức ăn'),
  ProductModel(
      'Product 1B', 'assets/images/pate_cat.png', 29.99, 3.8, 'Thức ăn'),
  ProductModel(
      'Product 2A', 'assets/images/pate_cat.png', 15.99, 4.2, 'Vệ sinh'),
  ProductModel(
      'Product 2B', 'assets/images/pate_cat.png', 25.99, 4.5, 'Vệ sinh'),
  ProductModel(
      'Product 3A', 'assets/images/pate_cat.png', 25.99, 4.7, 'Dụng cụ'),
  ProductModel(
      'Product 3B', 'assets/images/pate_cat.png', 25.99, 3.0, 'Dụng cụ'),
  ProductModel(
      'Product 3C', 'assets/images/pate_cat.png', 25.99, 3.0, 'Dụng cụ'),
  ProductModel(
      'Product 3D', 'assets/images/pate_cat.png', 25.99, 3.0, 'Dụng cụ'),
  ProductModel(
      'Product 3E', 'assets/images/pate_cat.png', 25.99, 3.0, 'Dụng cụ'),
  ProductModel(
      'Product 3F', 'assets/images/pate_cat.png', 25.99, 3.0, 'Dụng cụ'),
  // Thêm các sản phẩm khác cho các danh mục khác
];
