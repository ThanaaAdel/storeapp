import '../../models/product_model.dart';
import '../api_services/api_services.dart';

class PostDataProductServices {
  Future<ProductModel> postProduct(
      {
        required String title,
        required num price,
        required String category,
        required String image,
        required String description,
        required num id,
      }) async {

    Map<String,dynamic> data = await Api().post(
        uri: 'https://fakestoreapi.com/products',
        body: {'title': title, 'price': price.toString(), 'description': description, 'image': image, 'category': category,});

    print(data);
    return ProductModel.fromJson(data);

  }
}
