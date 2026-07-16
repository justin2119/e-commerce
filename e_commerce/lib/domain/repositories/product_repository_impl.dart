import 'dart:convert';
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
        if (decoded is Map<String, dynamic> && decoded['products'] is List) {
          final List<dynamic> productsJson = decoded['products'];
          return productsJson.map((json) => Product.fromJson(json)).toList();
        } else if (decoded is List) {
          // Some endpoints may return a raw list; reuse existing DTO mapping
          return decoded.map((json) => DtoProduct.fromJson(json).toModel()).toList();
        } else {
          throw Exception('Unexpected response format');
        }
      } else {
        throw Exception('Erreur lors du chargement des produits : ${response.statusCode}');
      }
    } catch (e) {
      // Fallback to local asset file from main branch
      final String response = await rootBundle.loadString('assets/products.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => DtoProduct.fromJson(json).toModel()).toList();
    }
  }
}
