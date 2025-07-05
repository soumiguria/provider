import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:test/providers/todo_provider.dart';
import 'package:test/screens/todo_screen.dart';

void main() {
  testWidgets('Todo App smoke test', (WidgetTester tester) async {
    // Wrap TodoScreen with ChangeNotifierProvider
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => TodoProvider(),
        child: MaterialApp(home: TodoScreen()),
      ),
    );

    // Verify "Add Todo" button exists
    expect(find.text('Add Todo'), findsOneWidget);

    // Enter text in TextField
    await tester.enterText(find.byType(TextField), 'Buy Milk');

    // Tap the Add button
    await tester.tap(find.text('Add Todo'));
    await tester.pump(); // Rebuild UI

    // Check if new todo appears
    expect(find.text('Buy Milk'), findsOneWidget);
  });
}
