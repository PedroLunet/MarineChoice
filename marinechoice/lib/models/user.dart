
class User{

  final int? id;
  final String? name;
  final String? username;
  final String? password;
  final bool? language;

  User({required this.id, required this.name, required this.username, required this.password, required this.language});

  factory User.fromJson(Map<String, dynamic> json) => User (
    id: json['id'],
    name: json['name'],
    username: json['username'],
    language: json['language'],
    password: json['password'],
  );

  Map<String, dynamic> toJson() => {
    'id' : id,
    'name' : name,
    'username' : username,
    'language' : language,
    'password' : password,
  };

}