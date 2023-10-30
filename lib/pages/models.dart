
import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  final String id;
  final String name;
  final String price;
  final String color;
  final String gender;
  final String category;
  final String? brand;
  final List<String> images;
  final Timestamp? timestamp;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.color,
    required this.gender,
    required this.category,
    this.brand,
    required this.images,
    this.timestamp,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      price: json['price'] as String,
      color: json['color'] as String,
      gender: json['gender'] as String,
      category: json['category'] as String,
      brand: json['brand'] as String,
      images: json['images'] as List<String>,
      timestamp: json['timestamp'] as Timestamp,
    );
  }
}