import 'package:flutter/foundation.dart';

@immutable
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String category;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.category,
  });

factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'].toString(),
      name: json['title'] as String, // DummyJSON uses 'title' instead of 'name'
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: (json['thumbnail'] ?? json['imageUrl']) as String, // DummyJSON uses 'thumbnail'
      category: json['category'] as String,
    );
  }

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? category,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
    );
  }
}
