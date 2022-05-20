// ignore_for_file: must_be_immutable, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, import_of_legacy_library_into_null_safe, avoid_unnecessary_containers, sort_child_properties_last, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_first_app/base_url.dart';
import 'package:flutter_first_app/models/category_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductForm extends StatefulWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController nameProductCtrl;
  late TextEditingController priceProductCtrl;
  late TextEditingController categoryProductCtrl;

  ProductForm({
    required this.formKey,
    required this.nameProductCtrl,
    required this.priceProductCtrl,
    required this.categoryProductCtrl,
  });

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

  // memanggil isi dari tabel categories
  late Future<List<CategoryModel>> categories;

  @override
  void initState() {
    super.initState();
    categories = getCategoryList();
  }

  final categoryListKey = GlobalKey<_ProductFormState>();
  String? selectedCategory;
  List? data = [];

  Future<List<CategoryModel>> getCategoryList() async {
    final url = "${BaseUrl.BASE_URL}/list_category.php";
    final response = await http.get(Uri.parse(url));
    final items =
        convert.json.decode(response.body).cast<Map<String, dynamic>>();

    List<CategoryModel> categories = items.map<CategoryModel>((json) {
      return CategoryModel.fromJson(json);
    }).toList();

    setState(() {
      data = items;
    });

    return categories;
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
          // disini ada dropdown
          Expanded(
            child: InputDecorator(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  icon: Icon(Icons.arrow_drop_down),
                  isExpanded: true,
                  underline: Container(height: 1.0, color: Colors.grey),
                  hint: Text('Select Category'),
                  value: selectedCategory,
                  items: data!.map(
                    (list) {
                      return DropdownMenuItem(
                        child: Row(
                          children: <Widget>[
                            Text(list['category_name'].toString()),
                          ],
                        ),
                        value: list['category_id'].toString(),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedCategory = value!;
                      print(selectedCategory.toString());
                      widget.categoryProductCtrl.text = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(12.0)),
        ],
      ),
    );
  }
}
