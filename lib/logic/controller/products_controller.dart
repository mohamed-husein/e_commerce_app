import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/services/products_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  List productsList =<ProductsModel> [].obs;
  var isLoading=true.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getProducts();
  }


  void getProducts() async {
    var products = await ProductsServices.getProducts();
    try {
      isLoading(true);
      if(products.isNotEmpty)
      {
        productsList.addAll(products);
      }
    }
    finally {
      isLoading(false);
    }
  }
}
