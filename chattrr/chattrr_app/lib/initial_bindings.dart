import 'package:chattrr_app/Bindigings/bindings.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Authenticationbindings>(Authenticationbindings());
  }
}
