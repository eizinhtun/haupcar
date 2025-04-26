import 'package:haupcar/data/services/network_service.dart';

import '../models/category_model.dart';

abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final NetworkService networkService;

  CategoryRemoteDataSourceImpl({required this.networkService});

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await networkService.get('products/categories', null);

    if (response != null) {
      final List<dynamic> categoryJson = response;
      return categoryJson.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
