import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/services/products_services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProductsController extends GetxController {
  List productsList = <ProductModels>[].obs;
  List favoriteList = [].obs;
  var isLoading = true.obs;
  var getStorage = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    List? storedShopping = getStorage.read<List>('isFavouritesList');
    if (storedShopping != null) {
      favoriteList =
          storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductsServices().getProducts();
    try {
      isLoading(true);
      if (products.isNotEmpty) {
        productsList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorite(int productId) async {
    var index = favoriteList.indexWhere((element) => element.id == productId);
    if (index >= 0) {
      favoriteList.removeAt(index);
      await getStorage.remove('isFavouritesList');
    } else {
      favoriteList
          .add(productsList.firstWhere((element) => element.id == productId));
      await getStorage.write('isFavouritesList', favoriteList);
    }
  }

  bool isFavorite(int productId) {
    return favoriteList.any((element) => element.id == productId);
  }
}
