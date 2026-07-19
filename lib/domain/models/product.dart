import 'package:flutter/foundation.dart';

@immutable
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String origin;
  final String conservationType;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.origin,
    required this.conservationType,
  });

  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    String? categoryId,
    String? origin,
    String? conservationType,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      categoryId: categoryId ?? this.categoryId,
      origin: origin ?? this.origin,
      conservationType: conservationType ?? this.conservationType,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'categoryId': categoryId,
      'origin': origin,
      'conservationType': conservationType,
    };
  }

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      description: (json['description'] ?? '') as String,
      price: (json['price'] as num).toDouble(),
      imageUrl: (json['imageUrl'] ?? '') as String,
      categoryId: (json['categoryId'] ?? '') as String,
      origin: (json['origin'] ?? '') as String,
      conservationType: (json['conservationType'] ?? '') as String,
    );
  }
}
