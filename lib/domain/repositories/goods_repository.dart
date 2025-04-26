import 'package:haupcar/domain/entities/entities.dart';

abstract class GoodsRepository {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
}
