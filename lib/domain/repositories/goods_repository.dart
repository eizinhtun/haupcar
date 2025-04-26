import '../entities/category.dart';
import '../entities/product.dart';

abstract class GoodsRepository {
  Future<List<Category>> getCategories();
  Future<List<Product>> getProductsByCategory(String category);
}
