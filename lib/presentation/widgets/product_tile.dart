import 'package:flutter/material.dart';
import 'package:haupcar/domain/entities/entities.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      color: Colors.white,
      child: ListTile(
        leading: Image.network(
          product.thumbnail,
          width: 100,
          height: 100,
        ),
        title: Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(product.description),
        //  Text('\$${product.price.toString()}'),
      ),
    );
  }
}
