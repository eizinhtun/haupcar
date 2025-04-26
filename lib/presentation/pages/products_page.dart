import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/di/app_di.dart';
import 'package:haupcar/presentation/bloc/products/products_bloc.dart';

import '../widgets/product_tile.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  const ProductsPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>()..add(FetchProducts(category)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Products: $category'),
        ),
        body: BlocBuilder<ProductsBloc, ProductsState>(
          builder: (context, state) {
            if (state is ProductsLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is ProductsLoaded) {
              return ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (context, index) {
                  final product = state.products[index];
                  return ProductTile(product: product);
                },
              );
            } else if (state is ProductsError) {
              return Center(child: Text(state.message));
            }
            return Container();
          },
        ),
      ),
    );
  }
}
