import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../data_test.dart';

class ProductRepositoryImpl implements IProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    // Simulating API call with test data
    return testProducts;
  }

  @override
  Future<Product?> getProductById(String id) async {
    try {
      return testProducts.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }
}
