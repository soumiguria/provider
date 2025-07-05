import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/providers/todo_provider.dart';
import 'package:test/screens/todo_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider(),
      child: MaterialApp(home: TodoScreen()),
    ),
  );
}
