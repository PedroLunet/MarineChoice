import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/pages/homepage.dart';

void main() {
  group('HomePage widget test', () {
    testWidgets('HomePage is correctly created', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: HomePage()));

      final appBarFinder = find.byType(AppBar);
      final bottomNavigationBarFinder = find.byType(BottomNavigationBar);
      final singleChildScrollViewFinder = find.byType(SingleChildScrollView);

      expect(appBarFinder, findsOneWidget);
      expect(bottomNavigationBarFinder, findsOneWidget);
      expect(singleChildScrollViewFinder, findsOneWidget);
    });
  });
}