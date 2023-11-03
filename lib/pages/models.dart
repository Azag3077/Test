
import 'dart:math';

class Product {
  final String id;
  final String name;
  final String price;
  final String size;
  final String color;
  final int qty;
  final String gender;
  final String category;
  final String? brand;
  final List<String> images;
  final String? count;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.size,
    required this.color,
    required this.qty,
    required this.gender,
    required this.category,
    this.brand,
    required this.images,
    this.count
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      size: json['size'],
      color: json['color'],
      qty: json['qty'],
      gender: json['gender'],
      category: json['category'],
      brand: json['brand'],
      images: List.generate(Random().nextInt(7) + 1, (index) => json['images'].first),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'size': size,
      'color': color,
      'qty': qty,
      'gender': gender,
      'category': category,
      'brand': brand,
      'images': images,
      'count': count,
    };
  }

  Product copyWith({
    String? id,
    String? name,
    String? price,
    String? size,
    String? color,
    int? qty,
    String? gender,
    String? category,
    String? brand,
    List<String>? images,
    String? count,
}) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      size: size ?? this.size,
      color: color ?? this.color,
      qty: qty ?? this.qty,
      gender: gender ?? this.gender,
      category: category ?? this.category,
      brand: brand ?? this.brand,
      images: images ?? this.images,
      count: count ?? this.count,
    );
  }
}