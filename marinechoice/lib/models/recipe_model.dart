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
  List<String>? ingredient;
  List<String>? preparation;
  String? author;

  RecipeData(
      {required this.id,
      required this.title,
      required this.sustainability,
      required this.cusineType,
      required this.rating,
      required this.permanentPost,
      required this.ingredient,
      required this.preparation,
      required this.author});

  RecipeData.fromJson(Map<dynamic, dynamic> json) {
    id = json["id"];
    title = json["title"];
    sustainability = json["sustainability"];
    cusineType = json["cusineType"];
    rating = json["rating"];
    permanentPost = json["permanentPost"];
    ingredient = List<String>.from(json['ingredients']).toList();
    preparation = List<String>.from(json['preparation']).toList();
    author = json["author"];
  }

  @override
  String toString() {
    return 'RecipeData{id: $id, title: $title, sustainability: $sustainability, cusineType: $cusineType, rating: $rating, permanentPost: $permanentPost, ingredient: $ingredient, preparation: $preparation, author: $author}';
  }
}
