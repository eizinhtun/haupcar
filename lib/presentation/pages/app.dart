import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:haupcar/presentation/bloc/category/category_bloc.dart';
import 'package:haupcar/presentation/bloc/products/products_bloc.dart';
import 'package:haupcar/presentation/pages/categories_page.dart';

import '../../../core/di/app_di.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CategoryBloc>()),
        BlocProvider(create: (context) => getIt<ProductsBloc>()),
      ],
      child: MaterialApp(
        title: 'Recipe Finder',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.light,
        builder: (context, child) {
          MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data: data.copyWith(textScaler: TextScaler.noScaling),
            child: child!,
          );
        },
        home: CategoriesPage(),
      ),
    );
  }
}
