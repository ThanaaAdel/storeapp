import 'package:storeapp/models/product_model.dart';
import '../api_services/api_services.dart';

class AllProductsSevices {
  Future<List<ProductModel>> getAllProduct() async {
    List<dynamic> data =
        await Api().get(uri: 'https://fakestoreapi.com/products', token: '');
    List<ProductModel> listProduct = [];
    for (int i = 0; i < data.length; i++) {
      listProduct.add(ProductModel.fromJson(data[i]));

    }
    return listProduct;
  }
}
