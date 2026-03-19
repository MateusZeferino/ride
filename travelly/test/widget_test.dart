import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:travelly/main.dart';

void main() {
  testWidgets('Splash redirects to login', (WidgetTester tester) async {
    await tester.pumpWidget(const TravellyApp());

    expect(find.text('Nunca foi tao facil planejar'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();

    expect(find.text('Nao possui conta ainda?'), findsOneWidget);
    expect(find.text('LOGIN'), findsOneWidget);
    expect(find.byIcon(Icons.add), findsNothing);
  });
}
