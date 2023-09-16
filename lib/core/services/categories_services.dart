import 'package:storeapp/models/product_model.dart';
import '../api_services/api_services.dart';

class CategoriesServices {
  Future<List<ProductModel>> getCategoriesServices() async {
    List<dynamic> data = await Api()
        .get(uri: 'https://fakestoreapi.com/products/category/:category_name');
    List<ProductModel> listProduct = [];

    for (int i = 0; i < data.length; i++) {
      listProduct.add(ProductModel.fromJson(data[i]));
    }

    return listProduct;
  }
}
