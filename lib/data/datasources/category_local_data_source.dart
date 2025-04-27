import 'package:haupcar/data/models/models.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class CategoryLocalDataSource {
  Future<void> saveCategoriesToCache(List<CategoryModel> categories);
  Future<List<CategoryModel>> getCategoriesFromCache();
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  CategoryLocalDataSourceImpl();

  @override
  Future<void> saveCategoriesToCache(List<CategoryModel> categories) async {
    final box = await Hive.openBox<CategoryModel>('categoriesBox');
    await box.clear();
    await box.addAll(categories);
  }

  @override
  Future<List<CategoryModel>> getCategoriesFromCache() async {
    final box = await Hive.openBox<CategoryModel>('categoriesBox');
    return box.values.toList();
  }
}
