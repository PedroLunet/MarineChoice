import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/models/recipe_model.dart';

void main() {
  group('Recipe model test', () {
    test('Recipe is correctly created from JSON', () {
      var json = {
        'id': 1,
        'title': 'Fish Soup',
        'sustainability': 0.8,
        'cusineType': 'Seafood',
        'rating': 4.5,
        'permanentPost': 1,
        'preparation': 'Boil the fish...',
        'author': {
          'idUser': 1,
          'name': 'John Doe',
          'username': 'johndoe',
          'password': 'password123',
          'language': true,
        },
      };

      var recipe = Recipe.fromJson(json);

      expect(recipe.id, 1);
      expect(recipe.title, 'Fish Soup');
      expect(recipe.sustainability, 0.8);
      expect(recipe.cusineType, 'Seafood');
      expect(recipe.rating, 4.5);
      expect(recipe.permanentPost, true);
      expect(recipe.preparation, 'Boil the fish...');
      expect(recipe.author.id, 1);
      expect(recipe.author.name, 'John Doe');
      expect(recipe.author.username, 'johndoe');
      expect(recipe.author.password, 'password123');
      expect(recipe.author.language, true);
    });

    test('Recipe is correctly converted to JSON', () {
      var author = User(
        id: 1,
        name: 'John Doe',
        username: 'johndoe',
        password: 'password123',
        language: true,
      );

      var recipe = Recipe(
        id: 1,
        title: 'Fish Soup',
        sustainability: 0.8,
        cusineType: 'Seafood',
        rating: 4.5,
        permanentPost: true,
        preparation: 'Boil the fish...',
        author: author,
      );

      var json = recipe.toJson();

      expect(json['id'], 1);
      expect(json['title'], 'Fish Soup');
      expect(json['sustainability'], 0.8);
      expect(json['cusineType'], 'Seafood');
      expect(json['rating'], 4.5);
      expect(json['permanentPost'], true);
      expect(json['preparation'], 'Boil the fish...');
      expect(json['author']['id'], 1);
      expect(json['author']['name'], 'John Doe');
      expect(json['author']['username'], 'johndoe');
      expect(json['author']['password'], 'password123');
      expect(json['author']['language'], true);
    });
  });
}