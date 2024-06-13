// app/screens/todo_list_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controller/todo_controller.dart';
import 'package:todo/view/todo_item.dart';


class TodoListScreen extends GetView<TodoController> {
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('todo_list'.tr),
      ),
      body: Obx(
        () => controller.todos.isEmpty
            ? Center(child: Text('no_todos'.tr))
            : ListView.builder(
                itemCount: controller.todos.length,
                itemBuilder: (ctx, index) {
                  final todo = controller.todos[index];
                  return TodoItem(
                    todo: todo,
                    onToggleStatus: () {
                      controller.toggleTodoStatus(todo);
                    },
                    onDelete: () {
                      controller.deleteTodo(todo);
                    },
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        child: Icon(Icons.add),
      ),
    );
  }

  void _showAddTodoDialog() {
    Get.defaultDialog(
      title: 'add_todo'.tr,
      content: TextField(
        controller: _titleController,
        decoration: InputDecoration(hintText: 'enter_todo_title'.tr),
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text('cancel'.tr.toUpperCase()),
        ),
        TextButton(
          onPressed: () {
            final title = _titleController.text.trim();
            if (title.isNotEmpty) {
              controller.addTodo(title);
              _titleController.clear();
              Get.back();
            }
          },
          child: Text('add'.tr.toUpperCase()),
        ),
      ],
    );
  }
}