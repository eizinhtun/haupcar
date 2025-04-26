// products_event.dart
part of 'products_bloc.dart';

abstract class ProductsEvent {}

class FetchProducts extends ProductsEvent {
  final String category;

  FetchProducts(this.category);
}
