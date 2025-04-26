import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/domain/domain.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsByCategory getProductsByCategory;

  ProductsBloc({required this.getProductsByCategory})
      : super(ProductsInitial()) {
    on<FetchProducts>(_onFetchProducts);
  }

  Future<void> _onFetchProducts(
      FetchProducts event, Emitter<ProductsState> emit) async {
    emit(ProductsLoading());
    try {
      final products = await getProductsByCategory(event.category);
      emit(ProductsLoaded(products));
    } catch (e) {
      emit(ProductsError('Failed to load products'));
    }
  }
}
