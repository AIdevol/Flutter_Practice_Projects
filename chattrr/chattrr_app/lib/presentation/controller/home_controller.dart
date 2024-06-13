import 'package:get/get.dart';

class HomeController extends GetxController {
  final _searchQuery = ''.obs;
   var selectedIndex = 0.obs;
  List<Map<String, String>> _filteredContacts = contactsData;

  List<Map<String, String>> get filteredContacts => _filteredContacts;

  @override
  void onInit() {
    super.onInit();
    _filterContacts(_searchQuery.value);
  }

  void filterContacts(String query) {
    _searchQuery.value = query;
    _filterContacts(query);
  }

void updateSelectedIndex(int index) {
   
    selectedIndex.value = index;
    // Add any additional logic you want to handle when changing tabs
  }

  void _filterContacts(String query) {
    _filteredContacts = query.isEmpty
        ? contactsData
        : contactsData
            .where((contact) =>
                contact['name']!.toLowerCase().contains(query.toLowerCase()))
            .toList();
  }
}


final List<Map<String, String>> contactsData = [
  {
    'name': 'Ved sir Weboapp',
    'message': 'hey sir!, how are you?😊',
    'avatar':
        'https://www.weboappdiscovery.com/wp-content/uploads/2023/04/Screenshot_20221209_122941.png'
  },
  {
    'name': 'Hr Mam',
    'message': 'hey mam!, We did it😊',
    'avatar':
        'https://media.istockphoto.com/id/1398385367/photo/happy-millennial-business-woman-in-glasses-posing-with-hands-folded.jpg?s=612x612&w=0&k=20&c=Wd2vTDd6tJ5SeEY-aw0WL0bew8TAkyUGVvNQRj3oJFw='
  },
  {
    'name': 'Rahul',
    'message': 'hey bro!, how are you?',
    'avatar':
        'https://images.unsplash.com/photo-1511367461989-f85a21fda167?q=80&w=1931&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
  },
  {
    "name": "Aisha",
    "message": "Hi there! How's your day going?",
    "avatar":
        "https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "name": "John",
    "message": "Hey, any plans for the weekend?",
    "avatar":
        "https://images.unsplash.com/photo-1457449940276-e8deed18bfff?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "name": "Emily",
    "message": "Hello! Just dropping by to say hi!",
    "avatar":
        "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "name": "Sophia",
    "message": "Hey! How's everything going?",
    "avatar":
        "https://media.istockphoto.com/id/1411155612/photo/side-profile-of-a-beautiful-young-black-woman-thinking-and-looking-powerful-standing-against.webp?s=2048x2048&w=is&k=20&c=LwgamRlN_dzFh9slpmefGEPRHgWT0GZivZG1zlR-PDE="
  },
  {
    "name": "David",
    "message": "Hi, it's been a while! What have you been up to?",
    "avatar":
        "https://plus.unsplash.com/premium_photo-1673866484792-c5a36a6c025e?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D "
  },
  {
    "name": "Emma",
    "message": "Hello! Just wanted to check in and see how you're doing.",
    "avatar":
        "https://plus.unsplash.com/premium_photo-1667667720425-6972aff75f6b?q=80&w=2069&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
  {
    "name": "Daniel",
    "message": "Hey! Long time no see. How have you been?",
    "avatar":
        "https://images.unsplash.com/photo-1423479185712-25d4a4fe1006?q=80&w=1776&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
  },
];
