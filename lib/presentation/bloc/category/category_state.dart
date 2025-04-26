import 'package:haupcar/domain/domain.dart';

sealed class CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded(this.categories);
}

final class CategorySelected extends CategoryState {
  final Category category;
  CategorySelected(this.category);
}

final class CategoryError extends CategoryState {
  final String message;
  CategoryError(this.message);
}
