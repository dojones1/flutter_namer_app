// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:namer_app/main.dart';

void main() {
  testWidgets('Nav bar correctly set', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.favorite), findsOneWidget);
  });

  testWidgets('No favourites initially', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Tap the 'heart' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump();

    // Verify that no favorites have been recorded
    expect(find.text('No favorites yet!'), findsOneWidget);
  });
  testWidgets('Can log a favourite', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    
    // Tap the 'heart' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.home));
    await tester.pump();

    // Tap the 'Like' button and trigger a frame.
    await tester.tap(find.text('Like'));
    await tester.pump(); 

    // Tap the 'heart' icon and trigger a frame.
    await tester.tap(find.text('Favorites'));
    await tester.pump();

    // Verify that a favourite has been logged
    expect(find.text('No favorites yet!'), findsNothing);
  });
}
