// app/utils/translations.dart
import 'package:get/get.dart';

class Translation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'todo_list': 'Todo List',
          'no_todos': 'No todos yet',
          'add_todo': 'Add Todo',
          'enter_todo_title': 'Enter todo title',
          'cancel': 'Cancel',
          'add': 'Add',
        }
      };
}