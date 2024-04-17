import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:marinechoice/pages/registerpage.dart';

void main() {
  group('RegisterPage', () {
    testWidgets('build returns correct widget tree', (WidgetTester tester) async {

      final widget = MaterialApp(
        home: RegisterPage(),
      );

      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(Container), findsWidgets);
      expect(find.byType(Center), findsWidgets);
      expect(find.byType(Column), findsOneWidget);
      expect(find.byType(Text), findsWidgets);
      expect(find.byType(TextField), findsWidgets);
      expect(find.byType(ElevatedButton), findsOneWidget);
    });
  });
}