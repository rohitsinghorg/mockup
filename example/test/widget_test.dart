import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockup/mockup.dart';

void main() {
  const screens = [
    'Automobile Data',
    'Building Data',
    'Emoji Data',
    'Flower Data',
    'Quote Data',
    'User Data',
    'Text Data',
    'Number Data',
  ];

  testWidgets('home screen lists every data category', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Mockup Example'), findsOneWidget);
    for (final label in [...screens, 'API Simulation']) {
      expect(find.widgetWithText(ElevatedButton, label), findsOneWidget);
    }
  });

  testWidgets('API Simulation loads pages and recovers from errors', (
    tester,
  ) async {
    Mockup.seed(1);
    addTearDown(Mockup.seed);
    tester.view.physicalSize = const Size(1080, 2400);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(const MyApp());
    await tester.tap(find.widgetWithText(ElevatedButton, 'API Simulation'));
    // Finish the route transition (300 ms) but not the 500 ms fetch delay.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 350));
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Wait for the first page, retrying any simulated failure.
    for (var i = 0; i < 10 && find.byType(ListTile).evaluate().isEmpty; i++) {
      await tester.pump(const Duration(seconds: 1));
      if (find.text('Retry').evaluate().isNotEmpty) {
        await tester.tap(find.text('Retry'));
        await tester.pump();
      }
    }

    expect(find.byType(ListTile), findsWidgets);
    expect(find.text('1'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  for (final label in screens) {
    testWidgets('"$label" screen opens without errors', (tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 1.0;
      addTearDown(tester.view.reset);

      await tester.pumpWidget(const MyApp());
      await tester.tap(find.widgetWithText(ElevatedButton, label));
      await tester.pumpAndSettle();

      expect(find.byType(BackButton), findsOneWidget);
      expect(tester.takeException(), isNull);
    });
  }
}
