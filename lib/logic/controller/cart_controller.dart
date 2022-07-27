import 'package:get/get.dart';

class CartController extends GetxController
{
  var productsMap = {}.obs;



  void addProductToCart(productsModel) {
    if (productsMap.containsKey(productsModel)) {
      productsMap[productsModel] += 1;
      print(productsMap.value.toString());
    } else {
      productsMap[productsModel] = 1;
      print(productsMap.value.toString());
    }
  }

  void removeProductsFarmCart(productModels) {
    if (productsMap.containsKey(productModels) &&
        productsMap[productModels] == 1) {
      productsMap.removeWhere((key, value) => key == productModels);
    } else {
      productsMap[productModels] -= 1;
    }


  }

  void removeOneProduct( productModels) {
    productsMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {

        productsMap.clear();

  }

  get productSubTotal =>
      productsMap.entries.map((e) => e.key.price * e.value).toList();

  get total => productsMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

}