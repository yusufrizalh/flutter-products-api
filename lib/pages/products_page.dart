// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_first_app/base_url.dart';
import 'package:flutter_first_app/models/product_model.dart';
import 'package:flutter_first_app/pages/add_product.dart';
import 'package:flutter_first_app/pages/product_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ProductsPage extends StatefulWidget {
  ProductsPage({Key? key}) : super(key: key);

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  late Future<List<ProductModel>> products;
  final productListKey = GlobalKey<_ProductsPageState>();

  // menampilkan semua data products diawal
  // membuat inisialisasi data diawal
  @override
  void initState() {
    super.initState();
    products = getProductsList();
  }

  Future<List<ProductModel>> getProductsList() async {
    final url = '${BaseUrl.BASE_URL}/select_products_categories.php';
    final response = await http.get(Uri.parse(url));

    final items =
        convert.json.decode(response.body).cast<Map<String, dynamic>>();

    // check isi response
    // print(response.body);

    List<ProductModel> products = items.map<ProductModel>((json) {
      return ProductModel.fromJson(json);
    }).toList();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Catalog'),
      ),
      body: Center(
        child: FutureBuilder(
          future: products,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              // jika data tidak ditemukan
              return CircularProgressIndicator(); // loading
            } else {
              // jika data ditemukan maka tampilkan ListView
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, position) {
                  var item = snapshot.data[position];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.mobile_friendly, color: Colors.grey),
                      trailing: Icon(Icons.list_alt, color: Colors.grey),
                      title: Text(
                        item.product_name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        // membuka detail product
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ProductDetails(productModel: item),
                          ),
                        );
                        print(
                            '${item.product_name.toString()}  -  ${item.product_price.toString()} - ${item.category_name.toString()}');
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // membuka form add product
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddProduct(),
            ),
          );
        },
      ),
    );
  }
}
