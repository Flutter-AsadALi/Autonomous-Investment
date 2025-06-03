import 'dart:convert';

ProductListModel productListModelFromJson(String str) => ProductListModel.fromJson(json.decode(str));

class ProductListModel {
  List<Product>? products;

  ProductListModel({this.products});

  factory ProductListModel.fromJson(Map<String, dynamic> json) =>
      ProductListModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );
}

class Product {
  int? id;
  String? title;
  String? description;
  double? price;
  String? brand;
  int? stock;
  String? thumbnail;
  String? availabilityStatus;

  Product({
    this.id,
    this.title,
    this.description,
    this.price,
    this.brand,
    this.stock,
    this.thumbnail,
    this.availabilityStatus,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    price: json["price"].toDouble(),
    brand: json["brand"],
    stock: json["stock"],
    thumbnail: json["thumbnail"],
    availabilityStatus: json["stock"] > 0 ? "In Stock" : "Out of Stock",
  );
}
