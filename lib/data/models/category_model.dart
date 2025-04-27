import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';

part 'category_model.g.dart'; // Needed for generated adapter

@HiveType(typeId: 0)
class CategoryModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String slug;

  CategoryModel({required this.slug, required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      slug: json['slug'],
    );
  }

  static CategoryModel fromString(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return CategoryModel.fromJson(map);
  }
}
