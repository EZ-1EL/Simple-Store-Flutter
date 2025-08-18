import 'package:simple_store_app/models/products_model.dart';

import '../helper/api.dart';

class AllProductsService {
  Future<List<ProductsModels>> getAllProdcuts() async {
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');

    List<ProductsModels> productList = [];
    for (int i = 0; i < data.length; i++) {
      productList.add(ProductsModels.fromJson(data[i]));
    }
    return productList;
  }
}
