import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.name, required this.category});
  final String category;
  final String name;

  @override
  _ProductsPageState createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsBloc>().add(FetchProducts(widget.category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CommonDrawer(),
      appBar: AppBar(
        title:
            Hero(tag: 'category-${widget.category}', child: Text(widget.name)),
      ),
      body: BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
        builder: (context, status) {
          if (status == ConnectivityStatus.disconnected) {
            return NoInternetWidget(
              onRetry: () {
                context
                    .read<ProductsBloc>()
                    .add(FetchProducts(widget.category));
              },
            );
          }
          return SingleChildScrollView(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: Column(
              children: [
                BlocBuilder<ProductsBloc, ProductsState>(
                  builder: (context, state) {
                    if (state is ProductsLoading) {
                      return ShimmerLoading(
                        height: 80,
                      );
                    } else if (state is ProductsLoaded) {
                      if (state.products.isEmpty) {
                        return EmptyListWidget(
                          onReload: () {
                            context
                                .read<ProductsBloc>()
                                .add(FetchProducts(widget.category));
                          },
                          title: AppLocalizations.of(context).noProducts,
                          subtitle:
                              AppLocalizations.of(context).tryDifferentCategory,
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<CategoryBloc>().add(LoadCategories());
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            final product = state.products[index];
                            return ProductTile(product: product);
                          },
                        ),
                      );
                    } else if (state is ProductsError) {
                      return ErrorStateWidget(
                        message: state.message,
                        onRetry: () {
                          context.read<CategoryBloc>().add(LoadCategories());
                        },
                      );
                    }
                    return Container();
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(AppLocalizations.of(context).back),
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
