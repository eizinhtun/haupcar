import 'package:haupcar/domain/entities/category.dart';

sealed class CategoryEvent {}

final class LoadCategories extends CategoryEvent {}

final class SelectCategory extends CategoryEvent {
  final Category category;
  SelectCategory(this.category);
}
