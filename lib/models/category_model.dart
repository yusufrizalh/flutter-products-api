// ignore_for_file: non_constant_identifier_names

class CategoryModel {
  // atribut
  late final int category_id;
  late final String category_name;

  // constructor
  CategoryModel({
    required this.category_id,
    required this.category_name,
  });

  // convert dari json ke maps
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      category_id: json['category_id'],
      category_name: json['category_name'],
    );
  }

  // convert maps ke json
  Map<String, dynamic> toJson() => {
        'category_id': category_id,
        'category_name': category_name,
      };
}
