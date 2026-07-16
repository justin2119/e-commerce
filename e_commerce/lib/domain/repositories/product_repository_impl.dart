import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';
import '../dto/dto.dart';

class ProductRepositoryImpl implements IProductRepository {
  static const String _baseUrl = 'https://dummyjson.com/products';

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        final dynamic decoded = json.decode(response.body);
        final List<dynamic> productsJson = decoded['products'];
        return productsJson.map((json) => DtoProduct.fromJson(json).toModel()).toList();
      } else {
        throw Exception('Erreur chargement produits: ${response.statusCode}');
      }
    } catch (e) {
      final String response = await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => DtoProduct.fromJson(json).toModel()).toList();
    }
  }

  @override
  Future<List<String>> getCategories() async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/categories'));
      if (response.statusCode == 200) {
        final List<dynamic> categories = json.decode(response.body);
        return categories.map((c) => c.toString()).toList();
      }
      throw Exception('Erreur catégories: ${response.statusCode}');
    } catch (e) {
      return ['Smartphones', 'Laptops', 'Fragrances', 'Skincare'];
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    try {
      final response = await http.get(Uri.parse('$_baseUrl/category/$category'));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'];
        return productsJson.map((json) => DtoProduct.fromJson(json).toModel()).toList();
      }
      throw Exception('Erreur produits catégorie: ${response.statusCode}');
    } catch (e) {
      throw Exception('Erreur réseau catégorie: $e');
    }
  }
}
