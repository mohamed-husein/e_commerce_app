import 'package:e_commerce_app/logic/controller/auth_controller.dart';
import 'package:get/get.dart';

class AuthBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}