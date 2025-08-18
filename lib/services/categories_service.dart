import 'package:simple_store_app/helper/api.dart';
import 'package:simple_store_app/models/products_model.dart';

class CategoriesService {
  Future<List<ProductsModels>> getCategoriesProducts({required String categoryName}) async{
    List<dynamic> data  = await Api().get(url: 'https://fakestoreapi.com/products/category/$categoryName');

      List<ProductsModels> productList = [];
      for (int i = 0; i < data.length; i++) {
            productList.add(ProductsModels.fromJson(data[i]));
          }
      return productList;
    }
}
