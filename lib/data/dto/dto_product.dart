import '../../domain/models/product.dart';

class DtoProduct {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String origin;
  final String conservationType;

  DtoProduct({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.categoryId,
    required this.origin,
    required this.conservationType,
  });

  factory DtoProduct.fromJson(Map<String, dynamic> json) {
    try {
      if (json['id'] == null) throw const FormatException('Missing field: id');
      if (json['name'] == null) throw const FormatException('Missing field: name');
      if (json['price'] == null) throw const FormatException('Missing field: price');
      
      return DtoProduct(
        id: json['id'] as String,
        name: json['name'] as String,
        description: (json['description'] ?? '') as String,
        price: (json['price'] as num).toDouble(),
        imageUrl: (json['imageUrl'] ?? '') as String,
        categoryId: (json['categoryId'] ?? '') as String,
        origin: (json['origin'] ?? '') as String,
        conservationType: (json['conservationType'] ?? '') as String,
      );
    } catch (e) {
      if (e is FormatException) rethrow;
      throw FormatException('Error parsing DtoProduct JSON: \$e');
    }
  }

  Product toDomain() {
    return Product(
      id: id,
      name: name,
      description: description,
      price: price,
      imageUrl: imageUrl,
      categoryId: categoryId,
      origin: origin,
      conservationType: conservationType,
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
}
