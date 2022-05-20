// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_first_app/base_url.dart';
import 'package:flutter_first_app/forms/product_form.dart';
import 'package:flutter_first_app/models/product_model.dart';
import 'package:flutter_first_app/pages/products_page.dart';
import 'package:http/http.dart' as http;

class EditProduct extends StatefulWidget {
  late final ProductModel productModel;

  EditProduct({required this.productModel});

  @override
  State<EditProduct> createState() => _EditProductState();
}

class _EditProductState extends State<EditProduct> {
  final formKey = GlobalKey<FormState>(); // membedakan form untuk add atau edit

  // atribut yang akan disimpan
  TextEditingController nameProductCtrl = TextEditingController();
  TextEditingController priceProductCtrl = TextEditingController();
  TextEditingController categoryProductCtrl = TextEditingController();

  Future updateProduct() async {
    final url = '${BaseUrl.BASE_URL}/update.php';
    return await http.post(
      Uri.parse(url),
      body: {
        "product_id": widget.productModel.product_id.toString(),
        "product_name": nameProductCtrl.text,
        "product_price": priceProductCtrl.text,
        "category_name": categoryProductCtrl.text,
      },
    );
  }

  @override
  void initState() {
    nameProductCtrl =
        TextEditingController(text: widget.productModel.product_name);
    priceProductCtrl = TextEditingController(
        text: widget.productModel.product_price.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
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
              confirmUpdateProduct(context);
            }
          },
          child: Text('Update Product'),
        ),
      ),
    );
  }

  void confirmUpdateProduct(context) async {
    await updateProduct();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductsPage(),
      ),
    );
  }
}
