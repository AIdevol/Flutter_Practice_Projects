import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:library_books/core/auth/login/login.dart';
import 'package:library_books/core/presentation/views/home_page.dart';
import 'package:library_books/helper/custom_loader.dart';
import 'package:library_books/splash_screen/splash_screen.dart';
import 'package:logger/logger.dart';

var log = Logger();
GetStorage storage = GetStorage();
CustomLoader customLoader = CustomLoader();
Future<void> main() async {
  await GetStorage.init();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
