import 'dart:core';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:marinechoice/models/user.dart';

class Recipe {
  final int? id;
  final String title;
  final double sustainability;
  final String cusineType;
  final Float? rating;
  final bool permanentPost;
  final String preparation;
  final User author;

  const Recipe({required this.title, required this.preparation, required this.author,required this.id,required this.sustainability,required this.cusineType,required this.rating,
    required this.permanentPost});

  factory Recipe.fromJson(Map<String, dynamic> json) => Recipe (
      id: json['id'],
      sustainability: json['sustainability'],
      cusineType: json['cusineType'],
      rating: json['rating'],
      permanentPost: json['permanentPost'] == 1 ? true : false,
      title: json['title'],
      preparation: json['preparation'],
      author: User(id: json['idUser'], name: json['name'], username: json['username'], password: json['password'], language: json['language'], ),
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'preparation' : preparation,
    'author' : author.toJson(),
    'sustainability' : sustainability,
    'cusineType' : cusineType,
    'rating' : rating,
    'permanentPost' : permanentPost
  };

  @override
  String toString() {
    return 'Título: $title\nPreparação: $preparation\nAutor: ${author.name}';
  }
}