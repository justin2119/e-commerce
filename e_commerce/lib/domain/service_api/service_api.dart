import 'package:dio/dio.dart';

class ServiceApi {
  Future<List<Map<String, dynamic>>> getProducts() async {
    final dio = Dio();
    final String baseUrl = "https://dummyjson.com/products";
    try {
      final response = await dio.get(baseUrl);
      if (response.statusCode == 200) {
        // We use .map() on the raw dynamic list to extract products.
        // Direct casting to List<Map<String, dynamic>> often fails with dynamic JSON lists.
        final List<dynamic> productsRaw = response.data['products'];
        return productsRaw.map((e) => e as Map<String, dynamic>).toList();
      } else {
        throw Exception("API Error");
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception("Product not found");
      } else if (e.response?.statusCode == 500) {
        throw Exception("Internal server error");
      } else if (e.response?.statusCode == 400) {
        throw Exception("Bad request");
      }
      throw Exception(e.message);
    }
  }
}
