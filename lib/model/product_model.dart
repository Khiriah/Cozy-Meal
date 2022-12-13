import 'dart:convert';

List<Prodect> productModelsFromJson(String str) =>
    List<Prodect>.from(
        json.decode(str).map((x) => Prodect.fromJson(x)));

String productModelsToJson(List<Prodect> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));




class Prodect {
  Prodect({
    this.productNumber,
    required this.productName,
    required this.category,
    required this.quantity,
    required this.price,
    required this.description,
    required this.imageUrl,
  });

  String? productNumber;
  final String productName;
  final String category;
  final int quantity;
  final double price;
  final String description;
  String imageUrl;

  factory Prodect.fromJson(Map<String, dynamic> json) => Prodect(
        productNumber: json["productNumber"],
        productName: json["productName"],
        category: json["category"],
        quantity: json["quantity"],
        price: json["price"].toDouble(),
        description: json["description"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "productNumber": productNumber,
        "productName": productName,
        "category": category,
        "quantity": quantity,
        "price": price,
        "description": description,
        "imageUrl": imageUrl,
      };
}
