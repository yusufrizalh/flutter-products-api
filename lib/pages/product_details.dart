// ignore_for_file: prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_first_app/base_url.dart';
import 'package:flutter_first_app/models/product_model.dart';
import 'package:flutter_first_app/pages/edit_product.dart';
import 'package:flutter_first_app/pages/products_page.dart';
import 'package:http/http.dart' as http;

class ProductDetails extends StatefulWidget {
  late final ProductModel productModel;
  ProductDetails({required this.productModel});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        actions: <Widget>[
          IconButton(
            onPressed: (() {
              // konfirmasi hapus product
              confirmDeleteProduct(context);
            }),
            icon: Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Product name: ${widget.productModel.product_name}',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.pink,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text('Product price: ${widget.productModel.product_price}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.edit),
        onPressed: () {
          // memanggil form edit product
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  EditProduct(productModel: widget.productModel),
            ),
          );
        },
      ),
    );
  }

  void confirmDeleteProduct(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text('Are you sure want to delete this product?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              style: ElevatedButton.styleFrom(primary: Colors.grey),
              child: Icon(Icons.cancel),
            ),
            ElevatedButton(
              onPressed: () => deleteProduct(),
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: Icon(Icons.check_box),
            ),
          ],
        );
      },
    );
  }

  void deleteProduct() async {
    final url = '${BaseUrl.BASE_URL}/delete.php';
    await http.post(
      Uri.parse(url),
      body: {
        'product_id': widget.productModel.product_id.toString(),
      },
    );
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ProductsPage(),
      ),
    );
  }
}
