import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:marinechoice/pages/recipeinfopage.dart';
import 'package:marinechoice/models/recipe_model.dart';

void main() {
  group('RecipeInfoPage', () {
    testWidgets('buildSingleChildScrollView returns correct widget tree', (WidgetTester tester) async {
      final recipe = Recipe(
        id: 1,
        title: 'Test Recipe',
        sustainability: 4.5,
        cusineType: 'Test Cuisine',
        rating: 4.5,
        permanentPost: true,
        preparation: 'Test Preparation',
        author: User(id: 1, name: 'Test Author', username: 'test', password: 'test', language: true),
      );
      final widget = MaterialApp(
        home: RecipeInfoPage(recipe: recipe),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.text('Test Recipe'), findsOneWidget);
      expect(find.text('Test Preparation'), findsOneWidget);
      expect(find.text('Test Author'), findsOneWidget);
    });
  });
}