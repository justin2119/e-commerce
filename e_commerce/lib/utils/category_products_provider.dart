import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/models/product.dart';
import 'product_provider.dart';

final categoryProductsProvider = FutureProvider.family<List<Product>, String>((ref, categoryName) async {
  return ref.watch(productRepositoryProvider).getProductsByCategory(categoryName);
});
