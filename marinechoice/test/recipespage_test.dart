import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:marinechoice/pages/recipespage.dart';
import 'package:marinechoice/dbhelper.dart';
import 'package:marinechoice/models/recipe_model.dart';

void main() {
  group('RecipesPage', () {
    testWidgets('buildSingleChildScrollView returns correct widget tree', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: RecipesPage(),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

     expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}