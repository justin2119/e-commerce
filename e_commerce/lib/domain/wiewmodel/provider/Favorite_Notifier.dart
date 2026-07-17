import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/product.dart';

class FavoriteNotifier extends Notifier<List<Product>> {
  @override
  List<Product> build() {
    return [];
  }

  void toggleFavorite(Product product) {
    final isExist = state.any((item) => item.id == product.id);
    if (isExist) {
      state = state.where((item) => item.id != product.id).toList();
    } else {
      state = [...state, product];
    }
  }

  bool isFavorite(Product product) {
    return state.any((item) => item.id == product.id);
  }
}

final favoriteProvider = NotifierProvider<FavoriteNotifier, List<Product>>(
  FavoriteNotifier.new,
);
