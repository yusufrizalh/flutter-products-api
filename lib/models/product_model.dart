// ignore_for_file: non_constant_identifier_names

class ProductModel {
  // atribut
  late final int product_id;
  late final String product_name;
  late final int product_price;

  // constructor
  ProductModel(
      {required this.product_id,
      required this.product_name,
      required this.product_price});

  // convert json to maps
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        product_id: json['product_id'],
        product_name: json['product_name'],
        product_price: json['product_price']);
  }

  // convert maps to json
  Map<String, dynamic> toJson() => {
        'product_id': product_id,
        'product_name': product_name,
        'product_price': product_price
      };
}
