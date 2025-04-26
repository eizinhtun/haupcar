import '../entities/product.dart';
import '../repositories/goods_repository.dart';

class GetProductsByCategory {
  final GoodsRepository repository;

  GetProductsByCategory(this.repository);

  Future<List<Product>> call(String category) async {
    return await repository.getProductsByCategory(category);
  }
}
