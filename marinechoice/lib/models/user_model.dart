import 'dart:core';

class User {
  String? key;
  UserData? userData;

  User({this.key, this.userData});
}

class UserData {
  String? username;
  String? email;


  UserData(this.username, this.email);

  UserData.fromJson(Map<dynamic, dynamic> json) {
    username = json["username"];
    email = json["email"];
  }
}