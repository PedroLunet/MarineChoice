import 'dart:core';

class Recipe {
  String? key;
  RecipeData? recipeData;

  Recipe({this.key, this.recipeData});
}

class RecipeData {
  String? title;
  String? cusineType;
  String? rating;
  List<String>? ingredients;
  List<String>? preparation;
  String? author;
  String? imagePath;

  RecipeData(
      {required this.title,
      required this.cusineType,
      required this.rating,
      required this.ingredients,
      required this.preparation,
      required this.author,
      required this.imagePath});

  RecipeData.fromJson(Map<dynamic, dynamic> json) {
    title = json["title"];
    cusineType = json["cusineType"];
    ingredients = List<String>.from(json['ingredients']).toList();
    preparation = List<String>.from(json['preparation']).toList();
    author = json["author"];
    imagePath = json["imagePath"];
  }

}
