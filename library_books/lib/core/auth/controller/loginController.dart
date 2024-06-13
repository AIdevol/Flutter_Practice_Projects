import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Logincontroller extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // final TextEditingController nameController = TextEditingController();
  RxBool obscureText = true.obs;

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  void login() {
    if (formKey.currentState!.validate()) {
      print("Validated");
      String email = emailController.text;
      String password = passwordController.text;

      // super.login();
    }
  }

  void onclose() {
    emailController.dispose();
    passwordController.dispose();
    // nameController.dispose();
    super.onClose();
  }
}
