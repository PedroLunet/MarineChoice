// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/pages/loginpage.dart';
import 'package:marinechoice/main.dart';

void main() {
  group('MyApp widget test', () {testWidgets('App crash', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(MaterialApp), findsOneWidget);
    });
  });

  group('LoginPage widget test', () {
    testWidgets('LoginPage crashing', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      expect(find.text('Login'), findsExactly(2));
    });

    testWidgets('LoginPage UI elements test', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: LoginPage()));
      expect(find.byType(TextField), findsNWidgets(2)); // Assuming there are 2 text fields
      expect(find.byType(ElevatedButton), findsOneWidget);
    });

    // You can add more tests for login functionality, navigation, error handling, etc.
  });
}

