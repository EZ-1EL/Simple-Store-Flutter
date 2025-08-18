import 'dart:ffi';

import '../helper/api.dart';
import '../models/products_model.dart';

class UpdateProductService {
  static Future<ProductsModels> updateProduct({
    required String title,
    required double price,
    required String desc,
    required String image,
    required int id,
    required String category,

  }) async {
    print('product id =$id');
    Map<String, dynamic> data = await Api().put(
      url: 'https://fakestoreapi.com/products/$id',
      body: {
        'title': title,
        'price': price.toString(), // ✅ الحل هون
        'description': desc,
        'image': image,
        'category': category,
      },
    );
    return ProductsModels.fromJson(data);
  }
}

