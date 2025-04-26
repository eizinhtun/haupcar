import 'dart:convert';

import 'package:haupcar/data/services/network_service.dart';

import '../models/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkService networkService;

  ProductRemoteDataSourceImpl({required this.networkService});

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response = await networkService.get(
        'https://dummyjson.com/products/category/$category', null);

    if (response.statusCode == 200) {
      final Map<String, dynamic> productJson = json.decode(response.body);
      final List<dynamic> products = productJson['products'];
      return products.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}
