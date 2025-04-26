import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/domain/domain.dart';
import 'category_event.dart';
import 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GetCategories getCategories;

  CategoryBloc({required this.getCategories}) : super(CategoryLoading()) {
    on<LoadCategories>(_onLoadCategories);
    on<SelectCategory>(_onSelectCategory);
  }

  Future<void> _onLoadCategories(
      LoadCategories event, Emitter<CategoryState> emit) async {
    emit(CategoryLoading());
    try {
      final categories = await getCategories();
      emit(CategoryLoaded(categories));
    } catch (e) {
      emit(CategoryError("Failed to load categories"));
    }
  }

  void _onSelectCategory(SelectCategory event, Emitter<CategoryState> emit) {
    emit(CategorySelected(event.category));
  }
}
