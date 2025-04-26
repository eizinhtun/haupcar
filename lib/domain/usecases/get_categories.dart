import '../entities/category.dart';
import '../repositories/goods_repository.dart';

class GetCategories {
  final GoodsRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
