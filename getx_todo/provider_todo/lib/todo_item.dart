// widgets/todo_item.dart
import 'package:flutter/material.dart';
import 'package:provider_todo/todo_model.dart';


class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;

  TodoItem({
    required this.todo,
    required this.onToggleStatus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (direction) {
        onDelete();
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.completed,
         // widgets/todo_item.dart (continued)
onChanged: (value) {
  onToggleStatus();
},
),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.completed ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}