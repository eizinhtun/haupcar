import 'package:haupcar/domain/entities/entities.dart';
import 'package:haupcar/domain/repositories/repositories.dart';

class GetProductsByCategory {
  final GoodsRepository repository;

  GetProductsByCategory(this.repository);

  Future<List<Product>> call(String category) async {
    return await repository.getProductsByCategory(category);
  }
}
