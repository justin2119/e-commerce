import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'product_provider.dart';

final categoriesProvider = FutureProvider<List<String>>((ref) async {
  return ref.watch(productRepositoryProvider).getCategories();
});
