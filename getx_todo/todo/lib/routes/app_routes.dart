// app/routes/app_pages.dart
import 'package:get/get.dart';
import 'package:todo/bindings/todo_bindngs.dart';
import 'package:todo/view/todo_view.dart';

class Routes {
  static const todoListScreen = '/todoListScreen';
}


class AppPages {
  static const initial = Routes.todoListScreen;

  static final routes = [
    GetPage(
      name: Routes.todoListScreen,
      page: () => TodoListScreen(),
      binding: TodoBinding(),
    ),
  ];
}