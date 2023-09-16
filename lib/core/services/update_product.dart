import '../../models/product_model.dart';
import '../api_services/api_services.dart';

class UpdateProductServices {
  Future<ProductModel> updateProduct(
      {
        required String title,
        required num price,
        required String category,
        required String image,
        required String description,
        required num id,
      }) async {
     print('the id : $id');
    Map<String,dynamic> data = await Api().put(
        url: 'https://fakestoreapi.com/products/$id',
        body: {'title': title, 'price': price.toString(), 'description': description, 'image': image, 'category': category,});

     print(data);
    return ProductModel.fromJson(data);

  }
}
