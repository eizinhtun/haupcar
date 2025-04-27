import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/presentation.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key, required this.name, required this.category});
  final String category;
  final String name;

  @override
  // ignore: library_private_types_in_public_api
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: Image.asset(
                'assets/icons/return.png',
                width: 24,
                height: 24,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          )
        ],
      ),
      body: BlocListener<ConnectivityCubit, ConnectivityStatus>(
        listener: (context, status) {
          if (status == ConnectivityStatus.disconnected) {
            Fluttertoast.showToast(
              msg:
                  "${AppLocalizations.of(context).noInternet}, ${AppLocalizations.of(context).checkConnection}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0,
            );
          }
        },
        child: SingleChildScrollView(
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
            ],
          ),
        ),
      ),
    );
  }
}
