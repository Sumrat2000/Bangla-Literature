// Basic smoke test for the বাংলা সাহিত্য app.
//
// The default `flutter create` template ships a counter-app test that
// pumps a `MyApp` widget — this project's root widget is
// `BanglaSahityaApp` (see lib/main.dart), so that template test doesn't
// apply here. This test instead verifies the app boots inside a
// ProviderScope and shows a loading state while its on-device Drift
// database import runs.

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:bangla_sahitya_app/main.dart';

void main() {
  testWidgets('BanglaSahityaApp boots and shows a loading indicator', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: BanglaSahityaApp()));

    // The content import runs asynchronously on startup (see
    // data/providers.dart), so right after the first frame the app
    // should be showing its loading state rather than crashing.
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
