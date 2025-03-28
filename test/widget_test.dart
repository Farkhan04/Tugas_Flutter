// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tugas_flutter/main.dart';

void main() {
testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  // Bangun aplikasi dan trigger frame.
  await tester.pumpWidget(const MyApp());  // Gunakan 'const'

  // Verifikasi bahwa counter dimulai dari 0.
  expect(find.text('0'), findsOneWidget);
  expect(find.text('1'), findsNothing);

  // Tap icon '+' dan trigger frame.
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump();

  // Verifikasi bahwa counter telah bertambah.
  expect(find.text('1'), findsOneWidget);
  expect(find.text('0'), findsNothing);
});

}
