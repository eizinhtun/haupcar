import 'package:flutter/material.dart';
import 'package:haupcar/domain/entities/entities.dart';
import 'package:haupcar/presentation/pages/pages.dart';

class CategoryTile extends StatelessWidget {
  final Category category;

  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 8,
        bottom: 8,
      ),
      color: Colors.white,
      child: ListTile(
        title: Text(category.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductsPage(name: category.name, category: category.slug),
            ),
          );
        },
      ),
    );
  }
}
