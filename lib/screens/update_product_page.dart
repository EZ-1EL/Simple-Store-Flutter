import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:simple_store_app/models/products_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_form_text_Field.dart';
import '../services/update_product.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({super.key});

  static String id = 'UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, description, imageUrl;

  String? price;
  bool isLoading = false;
  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProductsModels product =
        ModalRoute.of(context)!.settings.arguments as ProductsModels;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomFormInputField(
                  hintText: 'Product Name',
                  controller: nameController,
                  suffixIcon: Icons.drive_file_rename_outline,
                  onChanged: (data) {
                    productName = data;
                  },
                ),
                CustomFormInputField(
                  inputType: TextInputType.number,
                  hintText: 'Product Price',
                  controller: priceController,
                  suffixIcon: Icons.attach_money,
                  onChanged: (data) {
                    price = data;
                  },
                ),
                CustomFormInputField(
                  hintText: 'Description',
                  controller: descriptionController,
                  suffixIcon: Icons.description,
                  onChanged: (data) {
                    description = data;
                  },
                ),
                CustomFormInputField(
                  hintText: 'Image URL',
                  controller: imageController,
                  suffixIcon: Icons.image,
                  onChanged: (data) {
                    imageUrl = data;
                  },
                ),
                CustomButton(
                  text: 'Update',
                  onPressed: () async {
                    isLoading = true;
                    setState(() {});

                    try {
                     await updateProduct(product);
                      print('product updated');
                    } catch (e) {
                      print(e.toString());

                    }
                    isLoading = false;
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductsModels product) async{
   await UpdateProductService.updateProduct(
     id: product.id,
      title: productName == null ? product.title : productName!,
      price: price == null ? product.price : double.parse(price!),
      desc: description == null ? product.description : description!,
      image: imageUrl == null ? product.image : imageUrl!,
      category: product.category,
    );

  }
}
