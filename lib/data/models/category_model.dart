import 'dart:convert';

class CategoryModel {
  final String name;
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
