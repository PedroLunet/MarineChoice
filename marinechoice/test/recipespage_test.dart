import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:marinechoice/pages/recipespage.dart';

void main() {
  group('RecipesPage', () {
    testWidgets('buildSingleChildScrollView returns correct widget tree', (WidgetTester tester) async {
      const widget = MaterialApp(
        home: RecipesPage(),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

     expect(find.byType(SingleChildScrollView), findsOneWidget);
    });
  });
}