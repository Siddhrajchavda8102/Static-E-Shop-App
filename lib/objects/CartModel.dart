import 'dart:ui';

class CartModel {
  final String image;
  final String productName;
  final String brand;
  final String price;
  final String size;
  final Color color;

  CartModel({
    required this.image,
    required this.productName,
    required this.brand,
    required this.price,
    required this.size,
    required this.color
  });
}
