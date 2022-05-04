import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/services/products_services.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  List productsList = <ProductsModel>[].obs;
  List favoriteList = [].obs;
  var isLoading = true.obs;

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
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorite(int productId) {
    var index=favoriteList.indexWhere((element) => element.id==productId);
    if(index >=0){

      favoriteList.removeAt(index);
    }
    else{
      favoriteList
          .add(productsList.firstWhere((element) => element.id == productId));
    }

  }

  bool isFavorite(int productId){
    return favoriteList.any((element) => element.id==productId);
  }
}
