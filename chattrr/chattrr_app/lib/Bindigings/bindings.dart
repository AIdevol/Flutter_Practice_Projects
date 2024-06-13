import 'package:chattrr_app/presentation/controller/home_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class Authenticationbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
