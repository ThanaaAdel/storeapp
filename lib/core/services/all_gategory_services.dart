import '../api_services/api_services.dart';

class AllGategoryServices {
  Future<List<dynamic>> getAllGategory() async {
    List<dynamic> data =
        await Api().get(uri: 'https://fakestoreapi.com/products/categories');
    return data;
  }
}
