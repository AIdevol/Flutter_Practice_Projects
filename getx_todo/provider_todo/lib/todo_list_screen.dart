// screens/todo_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_todo/todo_item.dart';
import 'package:provider_todo/todo_provider.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final _titleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _showAddTodoDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Add Todo'),
        content: TextField(
          controller: _titleController,
          decoration: InputDecoration(hintText: 'Enter todo title'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text('CANCEL'),
          ),
          TextButton(
            onPressed: () {
              final title = _titleController.text.trim();
              if (title.isNotEmpty) {
                context.read<TodoProvider>().addTodo(title);
                _titleController.clear();
                Navigator.of(ctx).pop();
              }
            },
            child: Text('ADD'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, todoProvider, child) {
          final todos = todoProvider.todos;
          return todos.isEmpty
              ? Center(child: Text('No todos yet'))
              : ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (ctx, index) {
                    final todo = todos[index];
                    return TodoItem(
                      todo: todo,
                      onToggleStatus: () {
                        todoProvider.toggleTodoStatus(todo);
                      },
                      onDelete: () {
                        todoProvider.deleteTodo(todo);
                      },
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}