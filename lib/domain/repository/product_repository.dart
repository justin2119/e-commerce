import 'package:e_commerce/domain/models/product.dart';

abstract class ProductRepository {
  Future<List<Product>>getProducts();
}