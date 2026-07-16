import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/product.dart';
import '../domain/repositories/i_product_repository.dart';
import '../domain/repositories/product_repository_impl.dart';

final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRepositoryImpl();
});

class ProductNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    return ref.watch(productRepositoryProvider).getProducts();
  }
}

final productNotifierProvider = AsyncNotifierProvider<ProductNotifier, List<Product>>(ProductNotifier.new);
