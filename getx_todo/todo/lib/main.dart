// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/data/get_translation.dart';
import 'package:todo/routes/app_routes.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      translations: Translation(),
      locale: Locale('en', 'US'),
    ),
  );
}
