import 'dart:core';

class Rating {
  String? key;
  RatingData? ratingData;

  Rating({this.key, this.ratingData});
}

class RatingData {
  String? rating;
  String? recipe_title;
  String? user_email;


  RatingData(this.rating, this.recipe_title, this.user_email);

  RatingData.fromJson(Map<dynamic, dynamic> json) {
    rating = json["rating"];
    recipe_title = json["recipe_title"];
    user_email = json["user_email"];
  }
}