import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart';

class ProductsServices {
   Future<List<ProductsModel>> getProducts() async {
    Response response = await get(Uri.parse('$baseUrl/products'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('failed to load product');
    }
  }
}
