import 'dart:core';

class Recipe {
  String? key;
  RecipeData? recipeData;

  Recipe({this.key, this.recipeData});

  get ingredients => null;
}

class RecipeData {
  String? title;
  String? cusineType;
  String? rating;
  List<String>? fish;
  List<String>? preparation;
  List<String>? ingredients;
  String? author;
  String? imagePath;

  RecipeData(
      {required this.title,
      required this.cusineType,
      required this.rating,
      required this.fish,
      required this.ingredients,
      required this.preparation,
      required this.author,
      required this.imagePath});

  RecipeData.fromJson(Map<dynamic, dynamic> json, String language) {
    var data = json[language];
    title = json["title"];
    cusineType = json["cusineType"];
    rating = json["rating"];
    fish = List<String>.from(json['fish']).toList();
    ingredients = List<String>.from(json['ingredients']).toList();
    preparation = List<String>.from(json['preparation']).toList();
    author = json["author"];
    imagePath = json["imagePath"];
  }


}
