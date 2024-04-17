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
      expect(find.byType(TextField), findsNWidgets(2));
      expect(find.byType(ElevatedButton), findsOneWidget);
    });


  });
}

