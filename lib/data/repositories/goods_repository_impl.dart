import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:haupcar/data/data.dart';
import 'package:haupcar/domain/domain.dart';

class GoodsRepositoryImpl implements GoodsRepository {
  final CategoryRemoteDataSource categoryRemoteDataSource;
  final ProductRemoteDataSource productRemoteDataSource;
  final CategoryLocalDataSource categoryLocalDataSource;
  final ProductLocalDataSource productLocalDataSource;

  GoodsRepositoryImpl({
    required this.categoryRemoteDataSource,
    required this.productRemoteDataSource,
    required this.categoryLocalDataSource,
    required this.productLocalDataSource,
  });

  @override
  Future<List<Category>> getCategories() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    bool hasInternet = connectivityResult != ConnectivityResult.none;
    if (hasInternet) {
      try {
        final remote = await categoryRemoteDataSource.getCategories();
        await categoryLocalDataSource
            .saveCategoriesToCache(remote); // save to Hive
        return remote
            .map((model) => Category(name: model.name, slug: model.slug))
            .toList();
      } catch (_) {
        final local = await categoryLocalDataSource.getCategoriesFromCache();
        return local
            .map((model) => Category(name: model.name, slug: model.slug))
            .toList();
      }
    } else {
      final local = await categoryLocalDataSource.getCategoriesFromCache();
      return local
          .map((model) => Category(name: model.name, slug: model.slug))
          .toList();
    }
  }

  @override
  Future<List<Product>> getProductsByCategory(String category) async {
    final connectivityResult = await Connectivity().checkConnectivity();
    bool hasInternet = connectivityResult != ConnectivityResult.none;

    if (hasInternet) {
      try {
        final remote =
            await productRemoteDataSource.getProductsByCategory(category);
        await productLocalDataSource.saveProductsToCache(
            category, remote); // save to Hive
        return remote
            .map((model) => Product(
                  id: model.id,
                  title: model.title,
                  description: model.description,
                  price: model.price,
                  thumbnail: model.thumbnail,
                ))
            .toList();
      } catch (_) {
        final local =
            await productLocalDataSource.getProductsFromCache(category);
        return local
            .map((model) => Product(
                  id: model.id,
                  title: model.title,
                  description: model.description,
                  price: model.price,
                  thumbnail: model.thumbnail,
                ))
            .toList();
      }
    } else {
      final local = await productLocalDataSource.getProductsFromCache(category);
      return local
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
}
