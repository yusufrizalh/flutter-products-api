// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class ProductForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameProductCtrl;
  late TextEditingController priceProductCtrl;

  ProductForm(
      {required this.formKey,
      required this.nameProductCtrl,
      required this.priceProductCtrl});

  @override
  State<ProductForm> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductForm> {
  // validasi product_name minimal 8 karakter
  String? validateProductName(String? value) {
    if (value!.length < 8) return 'Product name must be at least 8 characters!';
    return null;
  }

  // validasi product_price harus diisi dengan angka saja
  String? validateProductPrice(String? value) {
    Pattern pattern = r'(?<=\s|^)\d+(?=\s|$)'; // hanya angka saja
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(value!)) return 'Product price must be number only!';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: widget.nameProductCtrl,
            validator: validateProductName,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Enter product name',
              border: OutlineInputBorder(),
            ),
          ),
          Padding(padding: EdgeInsets.all(12.0)),
          TextFormField(
            controller: widget.priceProductCtrl,
            validator: validateProductPrice,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Enter product price',
              border: OutlineInputBorder(),
            ),
          ),
          Padding(padding: EdgeInsets.all(12.0)),
        ],
      ),
    );
  }
}
