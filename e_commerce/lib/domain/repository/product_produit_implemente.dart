import 'package:e_commerce/domain/dto/dto.dart';
import 'package:e_commerce/domain/models/product.dart';
import 'package:e_commerce/domain/repository/product_repository.dart';

import '../service_api/service_api.dart';

class ProductProductImplemente implements ProductRepository {
  final ServiceApi _serviceApi;
  ProductProductImplemente(this._serviceApi);
  @override
  Future<List<Product>> getProducts() async {
    final response = await _serviceApi.getProducts();
    return response.map((json) => DtoProduct.fromJson(json).toModel()).toList();
  }
}