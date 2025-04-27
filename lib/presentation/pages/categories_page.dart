import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/core/core.dart';
import 'package:haupcar/presentation/bloc/blocs.dart';
import 'package:haupcar/presentation/widgets/widgets.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryBloc>().add(LoadCategories());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityCubit, ConnectivityStatus>(
      builder: (context, status) {
        if (status == ConnectivityStatus.disconnected) {
          return NoInternetWidget(
            onRetry: () {
              context.read<CategoryBloc>().add(LoadCategories());
            },
          );
        }
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: SingleChildScrollView(
            padding: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 16,
                ),
                Text(
                  AppLocalizations.of(context).categories,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Divider(),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return ShimmerLoading(
                        height: 50,
                      );
                    } else if (state is CategoryLoaded) {
                      if (state.categories.isEmpty) {
                        return EmptyListWidget(
                          onReload: () {
                            context.read<CategoryBloc>().add(LoadCategories());
                          },
                          title: AppLocalizations.of(context).noCategories,
                          subtitle: AppLocalizations.of(context).checkBackLater,
                        );
                      }
                      return RefreshIndicator(
                        onRefresh: () async {
                          context.read<CategoryBloc>().add(LoadCategories());
                        },
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: state.categories.length,
                          itemBuilder: (context, index) {
                            final category = state.categories[index];
                            return CategoryTile(category: category);
                          },
                        ),
                      );
                    } else if (state is CategoryError) {
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
        );
      },
    );
  }
}
