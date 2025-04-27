import 'package:haupcar/data/models/models.dart';
import 'package:haupcar/data/services/network_service.dart';

abstract class ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(String category);
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final NetworkService networkService;

  ProductRemoteDataSourceImpl({required this.networkService});

  @override
  Future<List<ProductModel>> getProductsByCategory(String category) async {
    final response =
        await networkService.get('products/category/$category', null);
    if (response != null) {
      final Map<String, dynamic> productJson = response;
      final List<dynamic> products = productJson['products'];
      final productList =
          products.map((json) => ProductModel.fromJson(json)).toList();
      return productList;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
