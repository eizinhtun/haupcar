import 'package:haupcar/domain/domain.dart';

sealed class CategoryEvent {}

final class LoadCategories extends CategoryEvent {}

final class SelectCategory extends CategoryEvent {
  final Category category;
  SelectCategory(this.category);
}
