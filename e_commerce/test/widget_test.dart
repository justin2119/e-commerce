import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:e_commerce/ui/feedback_screen.dart';

void main() {
  testWidgets('FeedbackScreen has a title and submit button', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FeedbackScreen()));

    expect(find.text('Votre avis'), findsOneWidget);
    expect(find.text('Envoyer'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(3));
  });

  testWidgets('FeedbackScreen shows error on empty submit', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: FeedbackScreen()));

    await tester.tap(find.text('Envoyer'));
    await tester.pump();

    expect(find.text('Veuillez entrer votre nom'), findsOneWidget);
    expect(find.text('Veuillez entrer votre email'), findsOneWidget);
    expect(find.text('Veuillez entrer votre message'), findsOneWidget);
  });
}
