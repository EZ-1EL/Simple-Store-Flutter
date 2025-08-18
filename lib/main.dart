
import 'package:flutter/material.dart';
import 'package:simple_store_app/screens/home_page.dart';
import 'package:simple_store_app/screens/update_product_page.dart';


void main() {
  runApp(SimpleStoreApp());
}

class SimpleStoreApp extends StatelessWidget {
  const SimpleStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MyHomePage.id: (context) => MyHomePage(),
        UpdateProductPage.id: (context) => UpdateProductPage(),
      },
      initialRoute: MyHomePage.id,

    );
  }
}




