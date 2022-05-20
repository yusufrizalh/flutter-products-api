// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_first_app/base_url.dart';
import 'package:flutter_first_app/forms/product_form.dart';
import 'package:flutter_first_app/pages/products_page.dart';
import 'package:http/http.dart' as http;

class AddProduct extends StatefulWidget {
  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final formKey = GlobalKey<FormState>(); // membedakan form untuk add atau edit

  // atribut yang akan disimpan
  TextEditingController nameProductCtrl = TextEditingController();
  TextEditingController priceProductCtrl = TextEditingController();
  TextEditingController categoryProductCtrl = TextEditingController();

  // method untuk menyimpan product baru
  Future createProduct() async {
    final url = '${BaseUrl.BASE_URL}/create.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "product_name": nameProductCtrl.text,
        "product_price": priceProductCtrl.text,
        "category_id": categoryProductCtrl.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Product'),
      ),
      body: Container(
        padding: EdgeInsets.all(8.0),
        height: double.infinity,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ProductForm(
              formKey: formKey,
              nameProductCtrl: nameProductCtrl,
              priceProductCtrl: priceProductCtrl,
              categoryProductCtrl: categoryProductCtrl,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: ElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              // perintah menyimpan product
              confirmCreateProduct(context);
            }
          },
          child: Text('Create Product'),
        ),
      ),
    );
  }

  void confirmCreateProduct(context) async {
    await createProduct();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductsPage(),
      ),
    );
  }
}
