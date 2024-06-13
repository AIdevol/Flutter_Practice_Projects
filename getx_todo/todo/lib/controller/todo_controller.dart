import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo/data/formate.dart';

class TodoController extends GetxController {
  final _dio = Dio();
  final _todos = <Todo>[].obs;

  List<Todo> get todos => _todos;

  @override
  void onInit() {
    super.onInit();
    fetchTodos();
  }

  Future<void> fetchTodos() async {
    try {
      final response =
          await _dio.get('https://jsonplaceholder.typicode.com/todos');
      if (response.statusCode == 200) {
        final data = response.data as List;
        _todos.value = data.map((json) => Todo.fromJson(json)).toList();
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
      final response = await _dio.post(
        'https://jsonplaceholder.typicode.com/todos',
        data: {'title': title, 'completed': false},
      );

      if (response.statusCode == 201) {
        final newTodo = Todo.fromJson(response.data);
        _todos.add(newTodo);
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
      final response = await _dio.put(
        'https://jsonplaceholder.typicode.com/todos/${todo.id}',
        data: {'completed': !todo.isCompleted},
      );

      if (response.statusCode == 200) {
        final updatedTodo = Todo.fromJson(response.data);
        final index = _todos.indexWhere((t) => t.id == updatedTodo.id);
        _todos[index] = updatedTodo;
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
      final response = await _dio
          .delete('https://jsonplaceholder.typicode.com/todos/${todo.id}');

      if (response.statusCode == 200) {
        _todos.removeWhere((t) => t.id == todo.id);
      } else {
        throw Exception('Failed to delete todo');
      }
    } catch (e) {
      print('Error deleting todo: $e');
      rethrow;
    }
  }
}
