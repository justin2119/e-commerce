import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  static const String _baseUrl = 'https://dummyjson.com/products';

  @override
  Future<List<Product>> getProducts() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> productsJson = data['products'];
        return productsJson.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Erreur lors du chargement des produits : ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Erreur réseau : $e');
    }
  }
}
