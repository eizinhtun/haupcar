import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haupcar/domain/entities/entities.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        vertical: 8,
      ),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: EdgeInsets.all(12),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: CachedNetworkImage(
            imageUrl: product.thumbnail,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
            errorWidget: (context, error, stackTrace) =>
                Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
            progressIndicatorBuilder: (context, child, progress) {
              return Center(child: CircularProgressIndicator.adaptive());
            },
          ),
        ),
        title: Text(
          product.title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          product.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
