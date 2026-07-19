import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/models/product.dart';
import '../dto/dto_product.dart';

class FavoriteRepository {
  static const String _favoritesKey = 'favorite_items';
  final SharedPreferences _prefs;

  FavoriteRepository(this._prefs);

  Future<void> saveFavorites(List<Product> items) async {
    final String jsonString = jsonEncode(
      items.map((e) => DtoProduct(
        id: e.id,
        name: e.name,
        description: e.description,
        price: e.price,
        imageUrl: e.imageUrl,
        categoryId: e.categoryId,
        origin: e.origin,
        conservationType: e.conservationType,
      ).toJson()).toList(),
    );
    await _prefs.setString(_favoritesKey, jsonString);
  }

  Future<List<Product>> getFavorites() async {
    final String? jsonString = _prefs.getString(_favoritesKey);
    if (jsonString == null) return [];
    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList
          .map((e) => DtoProduct.fromJson(e as Map<String, dynamic>).toDomain())
          .toList();
    } catch (e) {
      print('FavoriteRepository error: \$e');
      return [];
    }
  }
}
