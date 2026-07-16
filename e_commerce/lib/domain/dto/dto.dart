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
    // DummyJSON returns 'images' as a List<dynamic> of URLs.
    // We safely extract the first image or default to an empty string.
    final imagesList = json["images"] as List<dynamic>?;
    final primaryImage = (imagesList != null && imagesList.isNotEmpty)
        ? imagesList[0] as String
        : "";

    return DtoProduct(
      id: json["id"] as int,
      title: json["title"] as String,
      images: primaryImage,
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
      description: description,
      price: price,
      imageUrl: images,
      category: category,
    );
  }
}
