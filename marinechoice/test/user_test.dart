import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/models/user.dart';

void main() {
  group('User model test', () {
    test('User is correctly created from JSON', () {
      var json = {
        'id': 1,
        'name': 'John Doe',
        'username': 'johndoe',
        'password': 'password123',
        'language': true,
      };

      var user = User.fromJson(json);

      expect(user.id, 1);
      expect(user.name, 'John Doe');
      expect(user.username, 'johndoe');
      expect(user.password, 'password123');
      expect(user.language, true);
    });

    test('User is correctly converted to JSON', () {
      var user = User(
        id: 1,
        name: 'John Doe',
        username: 'johndoe',
        password: 'password123',
        language: true,
      );

      var json = user.toJson();

      expect(json['id'], 1);
      expect(json['name'], 'John Doe');
      expect(json['username'], 'johndoe');
      expect(json['password'], 'password123');
      expect(json['language'], true);
    });
  });
}