import 'package:haupcar/data/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ProductLocalDataSource {
  Future<void> saveProductsToCache(
      String category, List<ProductModel> products);

  Future<List<ProductModel>> getProductsFromCache(String category);
}

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  ProductLocalDataSourceImpl();

  @override
  Future<void> saveProductsToCache(
      String category, List<ProductModel> products) async {
    final box = await Hive.openBox<ProductModel>('productsBox_$category');
    await box.clear();
    await box.addAll(products);
  }

  @override
  Future<List<ProductModel>> getProductsFromCache(String category) async {
    final box = await Hive.openBox<ProductModel>('productsBox_$category');
    return box.values.toList();
  }
}
