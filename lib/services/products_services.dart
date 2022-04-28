import 'package:e_commerce_app/model/products_model.dart';
import 'package:e_commerce_app/utils/my_string.dart';
import 'package:http/http.dart' as http;
class ProductsServices {

  static Future getProducts() async
  {
    var response= await http.get(Uri.parse('$baseUrl/products'));

    if(response.statusCode==200){
      var jsonData=response.body;
      return productsModelFromJson(jsonData);
    }else
    {
      return throw Exception('failed to load product');
    }
  }
}