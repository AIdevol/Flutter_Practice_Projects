// app/bindings/bindings.dart
import 'package:get/get.dart';
import 'package:todo/controller/todo_controller.dart';

class TodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodoController>(() => TodoController());
  }
}