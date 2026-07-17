import '../models/product.dart';

abstract class IProductRepository {
  Future<List<Product>> getProducts();
  Future<List<String>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
}
