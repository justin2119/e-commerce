import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../data/repositories/cart_repository.dart';
import '../../../data/repositories/favorite_repository.dart';
import '../../models/product.dart';
import '../../repositories/i_product_repository.dart';

// 1. SharedPreferences Provider
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

// 2. Repository Providers
final productRepositoryProvider = Provider<IProductRepository>((ref) {
  return ProductRepository();
});

final cartRepositoryProvider = Provider<CartRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return CartRepository(prefs);
});

final favoriteRepositoryProvider = Provider<FavoriteRepository>((ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return FavoriteRepository(prefs);
});

// 3. Products Provider (FutureProvider)
final productsProvider = FutureProvider<List<Product>>((ref) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProducts();
});

// 4. Product Detail Provider (FutureProvider.family)
final productDetailProvider = FutureProvider.family<Product?, String>((ref, id) async {
  final repository = ref.watch(productRepositoryProvider);
  return repository.getProductById(id);
});

// 5. Cart Provider (AsyncNotifierProvider)
class CartNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final repository = ref.watch(cartRepositoryProvider);
    // State is loaded on initialization
    return repository.getCart();
  }

  Future<void> addItem(Product item) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentItems = state.value ?? [];
      final updatedItems = [...currentItems, item];
      // State is saved on every update
      await ref.read(cartRepositoryProvider).saveCart(updatedItems);
      return updatedItems;
    });
  }

  Future<void> removeItem(String id) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentItems = state.value ?? [];
      final updatedItems = currentItems.where((i) => i.id != id).toList();
      // State is saved on every update
      await ref.read(cartRepositoryProvider).saveCart(updatedItems);
      return updatedItems;
    });
  }
}

final cartProvider = AsyncNotifierProvider<CartNotifier, List<Product>>(CartNotifier.new);

// 6. Favorite Provider (AsyncNotifierProvider)
class FavoriteNotifier extends AsyncNotifier<List<Product>> {
  @override
  Future<List<Product>> build() async {
    final repository = ref.watch(favoriteRepositoryProvider);
    // State is loaded on initialization
    return repository.getFavorites();
  }

  Future<void> toggleFavorite(Product item) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final currentItems = state.value ?? [];
      final isFavorite = currentItems.any((i) => i.id == item.id);
      
      final updatedItems = isFavorite 
          ? currentItems.where((i) => i.id != item.id).toList()
          : [...currentItems, item];
      
      // State is saved on every update
      await ref.read(favoriteRepositoryProvider).saveFavorites(updatedItems);
      return updatedItems;
    });
  }
}

final favoriteProvider = AsyncNotifierProvider<FavoriteNotifier, List<Product>>(FavoriteNotifier.new);

// 7. Product Filter Provider (StateProvider)
class ProductFilter {
  final String searchQuery;
  final String category;
  final bool priceAscending;

  ProductFilter({
    this.searchQuery = '',
    this.category = 'Tous',
    this.priceAscending = true,
  });

  ProductFilter copyWith({
    String? searchQuery,
    String? category,
    bool? priceAscending,
  }) {
    return ProductFilter(
      searchQuery: searchQuery ?? this.searchQuery,
      category: category ?? this.category,
      priceAscending: priceAscending ?? this.priceAscending,
    );
  }
}

final productFilterProvider = StateProvider<ProductFilter>((ref) => ProductFilter());

// 8. User Profile Provider
class UserProfile {
  final String name;
  final String email;
  final String avatarUrl;

  UserProfile({required this.name, required this.email, required this.avatarUrl});
}

final userProfileProvider = Provider<UserProfile>((ref) {
  return UserProfile(
    name: 'Justin Draoude',
    email: 'justin@poke.com',
    avatarUrl: 'https://api.dicebear.com/7.x/avataaars/svg?seed=Justin',
  );
});

// 9. Filtered Products Provider
final filteredProductsProvider = Provider<AsyncValue<List<Product>>>((ref) {
  final productsAsync = ref.watch(productsProvider);
  final filter = ref.watch(productFilterProvider);

  return productsAsync.whenData((products) {
    var filtered = products.where((p) {
      final matchesSearch = p.name.toLowerCase().contains(filter.searchQuery.toLowerCase());
      final matchesCategory = filter.category == 'Tous' || p.categoryId == filter.category;
      return matchesSearch && matchesCategory;
    }).toList();

    filtered.sort((a, b) => filter.priceAscending 
        ? a.price.compareTo(b.price) 
        : b.price.compareTo(a.price));
        
    return filtered;
  });
});
