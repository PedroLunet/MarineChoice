import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:marinechoice/dbhelper.dart';
import 'package:marinechoice/models/recipe_model.dart';

void main() {
  sqfliteFfiInit();

  databaseFactory = databaseFactoryFfi;

  group('DataBaseHelperFilters', () {
    test('getAllRecipes returns all recipes', () async {
      var database = await openDatabase(inMemoryDatabasePath, version: 1, onCreate: DataBaseHelperFilters.create);

      await database.rawInsert(
          'INSERT INTO RECIPE (title, sustainability, cusineType, rating, permanentPost, preparation, author) VALUES (?, ?, ?, ?, ?, ?, ?)',
          ['Test Recipe', 4.5, 'Test Cuisine', 4.5, 1, 'Test Preparation', 1]
      );

      final result = await DataBaseHelperFilters.getAllRecipes();

      expect(result, isNotNull);
      expect(result!.length, 1);
      expect(result[0].title, 'Test Recipe');
    });
  });
}