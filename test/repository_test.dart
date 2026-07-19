import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../lib/data/repositories/cart_repository.dart';
import '../lib/data/repositories/favorite_repository.dart';
import '../lib/domain/models/product.dart';

void main() {
  group('Repository Persistence Tests', () {
    late SharedPreferences prefs;
    const testProduct = Product(
      id: 'test_1',
      name: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      imageUrl: 'https://example.com/image.jpg',
      categoryId: 'test_cat',
      origin: 'Test Origin',
      conservationType: 'Test Conservation',
    );

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      prefs = await SharedPreferences.getInstance();
    });

    test('CartRepository should save and load products correctly', () async {
      final repository = CartRepository(prefs);
      
      // Initial state
      expect(await repository.getCart(), isEmpty);

      // Save
      await repository.saveCart([testProduct]);
      
      // Load
      final loadedCart = await repository.getCart();
      expect(loadedCart.length, 1);
      expect(loadedCart[0].id, testProduct.id);
      expect(loadedCart[0].name, testProduct.name);
    });

    test('FavoriteRepository should save and load products correctly', () async {
      final repository = FavoriteRepository(prefs);
      
      // Initial state
      expect(await repository.getFavorites(), isEmpty);

      // Save
      await repository.saveFavorites([testProduct]);
      
      // Load
      final loadedFavorites = await repository.getFavorites();
      expect(loadedFavorites.length, 1);
      expect(loadedFavorites[0].id, testProduct.id);
      expect(loadedFavorites[0].price, testProduct.price);
    });

    test('Repositories should handle corrupted data gracefully', () async {
      final cartRepo = CartRepository(prefs);
      await prefs.setString('cart_items', 'invalid_json');
      
      final result = await cartRepo.getCart();
      expect(result, isEmpty);
    });
  });
}
