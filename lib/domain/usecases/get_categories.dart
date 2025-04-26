import 'package:haupcar/domain/entities/entities.dart';
import 'package:haupcar/domain/repositories/repositories.dart';

class GetCategories {
  final GoodsRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}
