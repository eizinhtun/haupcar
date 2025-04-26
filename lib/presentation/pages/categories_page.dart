import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/di/app_di.dart';
import 'package:haupcar/presentation/bloc/category/category_bloc.dart';
import 'package:haupcar/presentation/bloc/category/category_event.dart';
import 'package:haupcar/presentation/bloc/category/category_state.dart';

import '../widgets/category_tile.dart';

class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryBloc>()..add(LoadCategories()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Category'),
        ),
        body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            if (state is CategoryLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is CategoryLoaded) {
              return ListView.builder(
                itemCount: state.categories.length,
                itemBuilder: (context, index) {
                  final category = state.categories[index];
                  return CategoryTile(category: category);
                },
              );
            } else if (state is CategoryError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
