import 'dart:convert';
import 'package:flutter/services.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/i_product_repository.dart';

class ProductRepositoryImpl implements IProductRepository {
  @override
  Future<List<Product>> getProducts() async {
    final String response = await rootBundle.loadString('assets/products.json');
    final List<dynamic> data = json.decode(response);
    return data.map((json) => Product.fromJson(json)).toList();
  }
}
