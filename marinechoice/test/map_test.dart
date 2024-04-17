import 'package:flutter_test/flutter_test.dart';
import 'package:marinechoice/pages/mappage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';


void main() {

  group('MapPage widget test', () {
    testWidgets('MapPage loading', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MapPage()));
      expect(find.text('Loading...'), findsOneWidget);
    });

    testWidgets('MapPage map', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MapPage()));
      expect(find.byType(MapPage), findsOneWidget);
    });

    // testWidgets('MapPage location', (WidgetTester tester) async {
    //   await tester.pumpWidget(const MaterialApp(home: MapPage()));
    //   expect(find.byType(Location), findsOneWidget);
    // });

    // testWidgets('MapPage markers', (WidgetTester tester) async {
    //   await tester.pumpWidget(const MaterialApp(home: MapPage()));
    //   expect(find.byType(Marker), findsOneWidget);
    // });

    testWidgets('MapPage when _currentP is null', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: MapPage()));
      expect(find.text('Loading...'), findsOneWidget);
    });
  });

  group('MapPage', () {
    testWidgets('build returns correct widget tree', (WidgetTester tester) async {
      final widget = MaterialApp(
        home: MapPage(),
      );
      await tester.pumpWidget(widget);
      await tester.pumpAndSettle();

      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      expect(find.byType(GoogleMap), findsOneWidget);
    });
  });
  }

