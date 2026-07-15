import 'dart:async';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/wiewmodel/provider/provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() {
    final data = ref.watch(ProduitRepositoryProvider);
    return data.getProducts();
  }

  Future<void> refresh() async {
    state = await AsyncValue.guard(
      () async => await ref.read(ProduitRepositoryProvider).getProducts(),
    );
  }
}

final productNotifierProvider = AsyncNotifierProvider<ProductNotifier,List<Product>>(ProductNotifier.new);
