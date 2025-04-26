import 'dart:convert';

class CategoryModel {
  final String name;

  CategoryModel({required this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(name: json['name']);
  }

  static CategoryModel fromString(String jsonString) {
    Map<String, dynamic> map = jsonDecode(jsonString);
    return CategoryModel.fromJson(map);
  }
}
