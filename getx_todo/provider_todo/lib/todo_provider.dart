// providers/todo_provider.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider_todo/todo_model.dart';
import 'dart:convert';

class TodoProvider extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  Future<void> fetchTodos() async {
    try {
      final response = await http.get(Uri.https('jsonplaceholder.typicode.com', 'todos'));
      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        _todos = data.map((json) => Todo.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load todos');
      }
    } catch (e) {
      print('Error fetching todos: $e');
      rethrow;
    }
  }

  Future<void> addTodo(String title) async {
    try {
      final response = await http.post(
        Uri.https('jsonplaceholder.typicode.com', 'todos'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'title': title,
          'completed': 'false',
        }),
      );

      if (response.statusCode == 201) {
        final newTodo = Todo.fromJson(jsonDecode(response.body));
        _todos.add(newTodo);
        notifyListeners();
      } else {
        throw Exception('Failed to create todo');
      }
    } catch (e) {
      print('Error adding todo: $e');
      rethrow;
    }
  }

  Future<void> toggleTodoStatus(Todo todo) async {
    try {
      final response = await http.put(
        Uri.https('jsonplaceholder.typicode.com', 'todos/${todo.id}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, bool>{
          'completed': !todo.completed,
        }),
      );

      if (response.statusCode == 200) {
        final updatedTodo = Todo.fromJson(jsonDecode(response.body));
        final index = _todos.indexWhere((t) => t.id == updatedTodo.id);
        _todos[index] = updatedTodo;
        notifyListeners();
      } else {
        throw Exception('Failed to update todo status');
      }
    } catch (e) {
      print('Error updating todo status: $e');
      rethrow;
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      final response = await http.delete(Uri.https('jsonplaceholder.typicode.com', 'todos/${todo.id}'));

      if (response.statusCode == 200) {
        _todos.removeWhere((t) => t.id == todo.id);
        notifyListeners();
      } else {
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      print('Error deleting todo: $e');
      rethrow;
    }
  }
}