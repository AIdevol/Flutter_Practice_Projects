// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider_todo/todo_list_screen.dart';
import 'package:provider_todo/todo_provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TodoProvider()..fetchTodos(),
      child: TodoApp(),
    ),
  );
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      home: TodoListScreen(),
    );
  }
}