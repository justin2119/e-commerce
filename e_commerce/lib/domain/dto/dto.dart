import '../models/product.dart';

class DtoProduct {
  final int id;
  final String title;
  final String description;
  final String category;
  final String images;
  final double price;
  final double rating;
  final int stock;
  DtoProduct({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.price,
    required this.rating,
    required this.stock,
    required this.images,
  });
  factory DtoProduct.fromJson(Map<String, dynamic> json) {
    return DtoProduct(
      id: json["id"] as int,
      title: json["title"] as String,
      images: json["images"] as String,
      category: json["category"] as String,
      description: json["description"] as String,
      price: (json["price"] as num).toDouble(),
      rating: (json["rating"] as num).toDouble(),
      stock: json["stock"] as int,
    );
  }
  Product toModel() {
    return Product(
      id: id,
      name: title,
      description:description,
      price: price,
      imageUrl: images,
      category:category,
    );
  }
}
