import 'package:e_commerce_app/logic/controller/cart_controller.dart';
import 'package:e_commerce_app/logic/controller/category_controller.dart';
import 'package:e_commerce_app/logic/controller/products_controller.dart';
import 'package:get/get.dart';

class ProductsBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ProductsController());
    Get.put( CartController(),);
    Get.put( CategoryController(),);
  }
}