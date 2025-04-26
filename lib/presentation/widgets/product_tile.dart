import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  ProductTile({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(product.thumbnail),
      title: Text(product.title),
      subtitle: Text('\$${product.price.toString()}'),
    );
  }
}
