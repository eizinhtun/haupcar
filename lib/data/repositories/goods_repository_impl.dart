import 'package:haupcar/data/data.dart';
import 'package:haupcar/domain/domain.dart';

class GoodsRepositoryImpl implements GoodsRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final ProductRemoteDataSource productRemoteDataSource;

  GoodsRepositoryImpl({
    required this.categoryRemoteDataSource,
    required this.productRemoteDataSource,
  });

  @override
  Future<List<Category>> getCategories() async {
    final categoryModels = await categoryRemoteDataSource.getCategories();
    return categoryModels.map((model) => Category(name: model.name)).toList();
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final productModels =
        await productRemoteDataSource.getProductsByCategory(category);
    return productModels
        .map((model) => Product(
              id: model.id,
              title: model.title,
              description: model.description,
              price: model.price,
              thumbnail: model.thumbnail,
            ))
        .toList();
  }
}
