import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  const ProductsPage({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ProductsBloc>()..add(FetchProducts(category)),
      child: Scaffold(
        drawer: CommonDrawer(),
        appBar: AppBar(
          title: Text(category),
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
