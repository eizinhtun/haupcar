import 'package:flutter/material.dart';
import '../../domain/entities/category.dart';
import '../pages/products_page.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  CategoryTile({required this.category});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(category.name),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductsPage(category: category.name),
          ),
        );
      },
    );
  }
}
