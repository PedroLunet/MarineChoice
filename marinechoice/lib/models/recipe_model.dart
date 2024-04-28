import 'dart:core';

class Recipe {
 String? key;
 RecipeData? recipeData;

 Recipe({this.key, this.recipeData});

}

class RecipeData {
  String? id;
  String? title;
  String? sustainability;
  String? cusineType;
  String? rating;
  String? permanentPost;
  String? preparation;
  String? author;

  RecipeData(
      {required this.id,
      required this.title,
      required this.sustainability,
      required this.cusineType,
      required this.rating,
      required this.permanentPost,
      required this.preparation,
      required this.author});

  RecipeData.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    title = json["title"];
    sustainability = json["sustainability"];
    cusineType = json["cusineType"];
    rating = json["rating"];
    permanentPost = json["permanentPost"];
    preparation = json["preparation"];
    author = json["author"];
  }
}